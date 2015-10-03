class IssuesController < ApplicationController
  def index
    @issues = Issue.all
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

  def show
    @issue = Issue.find_by_id(params[:id])
  end

  def issue_search
    @issues = Issue.where(:category_id => params["category"], :language_id => params["language"])
    puts(@issues.inspect)
  end

  private

  def issue_params
    params.require(:issue).permit(:category_id, :language_id, :title)
  end
end
