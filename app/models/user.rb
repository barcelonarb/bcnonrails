class User < ActiveRecord::Base
  has_many :authentications, dependent: :destroy

  validates :nickname, presence: true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.new_with_session(params, session)
    user = super
    user.apply_oauth(session['devise.oauth'])
    user
  end

  def apply_oauth(auth = {})
    if auth.present?
      if (oauth_info = auth['info'] || {})
        self.tap do |u|
          u.email     = oauth_info['email'] if email.blank?
          u.nickname  = oauth_info['nickname'] if nickname.blank?
          u.name      = oauth_info['name'] if name.blank?
        end
      end
      
      authentications.build(provider: auth['provider'], uid: auth['uid'])
    end
  end

  # Only require password if user come from regular signup
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  # Monkey patch for allow users to setup a password when they signup
  # using an oauth provider
  def update_with_password(params, *options)
    if authentications.present? && encrypted_password.blank?
      params.delete(:current_password)

      result = update_attributes(params, *options)
      clean_up_passwords
      result
    else
      super
    end
  end
end
