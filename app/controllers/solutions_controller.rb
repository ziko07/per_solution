class SolutionsController < ApplicationController

  def index
    @solutions = Solution.all
  end

  def show
  end

  def new
    @solution = Solution.new
  end

  def edit
  end

  def create
    issue = Issue.find_by_id(params[:issue_id])
    solution = issue.solutions.build(solution_params)
    respond_to do |format|
      if solution.save
        format.json {
          render :json => solution
        }
        format.html {}
      end
    end
  end

  def update
    issue = Issue.find_by_id(params[:issue_id])
    solution = issue.solutions.find_by_id(params[:id])
    respond_to do |format|
      if solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { render json: solution, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url, notice: 'Solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def solution_params
    params.require(:solution).permit(:issue_id, :description)
  end
end
