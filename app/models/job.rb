class Job < ActiveRecord::Base
  validates_presence_of :user, :company, :title, :description, :email
  
  belongs_to :company
  belongs_to :user
  
  after_create :deliver_job_to_bcnonrails!
  
  def deliver_job_to_bcnonrails!        
    Notifier.deliver_job_to_bcnonrails(self)
  end
end
