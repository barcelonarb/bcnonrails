class Job < ActiveRecord::Base
  validates_presence_of :user, :company, :title, :description, :email
  
  belongs_to :company
  belongs_to :user
end
