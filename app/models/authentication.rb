class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user, :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
end
