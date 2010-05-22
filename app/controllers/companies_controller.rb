class CompaniesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  
  def index
    @companies = Company.all(:order => "name")
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    @company.website = "http://" + @company.website.to_s unless /http:\/\/|https:\/\//.match(@company.website)
    if @company.save
      flash[:notice] = 'Company was successfully created.'
      redirect_to(@company)
    else
      render :action => "new"
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      flash[:notice] = 'Company was successfully updated.'
      redirect_to(@company)
    else
      render :action => "edit"
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to(companies_url)
  end
end
