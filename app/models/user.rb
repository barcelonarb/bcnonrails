class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authentications, dependent: :destroy

  def self.new_with_session(params, session)
    user = super
    user.apply_oauth(session['devise.oauth'])
    user
  end

  def apply_oauth(auth = {})
    if auth.present?
      oauth_email = auth['info'] && auth['info']['email']

      self.email = oauth_email if email.blank?
      authentications.build(provider: auth['provider'], uid: auth['uid'])
    end
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
