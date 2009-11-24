class JobsController < ApplicationController
  before_filter :require_user, :load_companies, :except => [:index, :show]
  before_filter :should_be_current_user, :only => [:edit, :update, :destroy]
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(params[:job])
    @job.user_id =  @current_user.id

    if @job.save
      flash[:notice] = 'Job was successfully created.'
      redirect_to(@job)
    else
      render :action => "new"
    end
  end

  def update
    if @job.update_attributes(params[:job])
      flash[:notice] = 'Job was successfully updated.'
      redirect_to(@job)
    else
      render :action => "edit"
    end
  end

  def destroy
    @job.destroy

    redirect_to(jobs_url)
  end
  
  private
    def load_companies
      @companies = Company.all
    end
    def should_be_current_user
      @job = Job.find(params[:id])
      if(current_user != @job.user)
        flash[:error] = "You must be the creator of this job to edit it."
        redirect_to jobs_url
      end
    end
end
