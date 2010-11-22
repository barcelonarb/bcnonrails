class User < ActiveRecord::Base
  acts_as_authentic

  belongs_to  :company
  has_many    :jobs

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def self.random number
    (1..number).map{|u| self.offset(rand self.count).limit(1).first}
  end
end

