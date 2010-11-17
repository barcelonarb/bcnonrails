class User < ActiveRecord::Base
  acts_as_authentic

  belongs_to  :company
  has_many    :jobs

  named_scope :random, lambda { |random| {:order => "login ASC", :limit => random }} #TODO: implement cross-database random

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end

