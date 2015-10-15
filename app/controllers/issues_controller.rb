class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    @credentials = Credential.all
    @requirements = Requirement.all
    respond_to do |format|
      format.json { render json: @issues.to_json(:include => [:category, :language]) }
      format.html{render :layout => layout_name}
    end
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.create(issue_params)
    redirect_to issues_url
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @issue = Issue.all
    respond_to do |format|
      format.json { render json: @issue }
    end
  end

  def show
    @issue = Issue.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json: @issue.to_json(:include => [:category, :language, :solutions]) }
      format.html{render :layout => layout_name}
    end
  end

  def issue_search
    @issues = Issue.where(:category_id => params["category"], :language_id => params["language"])
    puts(@issues.inspect)
  end

  private

  def layout_name
    if params[:layout] == 0
      false
    else
      'application'
    end
  end

  def issue_params
    params.require(:issue).permit(:category_id, :language_id, :title)
  end
end
