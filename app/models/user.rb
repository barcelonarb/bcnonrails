class User < ActiveRecord::Base
  acts_as_authentic

  belongs_to  :company
  has_many    :jobs

  def self.random number
    total=self.count
    (1..[number,total].min).map{|u| self.offset(rand(total).floor).limit(1).first}
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end


end

