class ProblemsController < ApplicationController

  def index
    @problems = Problem.find :all 
  end

  def new
    # default: create new template
  end

  def show
    id = params[:id]
    @problem = Problem.find(id)
    #will render app/views/problems/show.<extension> by default
  end

  def create
    @problem = Problem.create!(params[:problem])
    flash[:notice] = "#{@problem.title} was successfully created."
    redirect_to problems_path #make sure this is the right route
  end

  def edit
    @problem = Problem.find params[:id]
  end

  def update
    @problem = Problem.find params[:id]
    @problem.update_attributes!(params[:problem])
    flash[:notice] = "#{@problem.title} was successfully updated."
    redirect_to problem_path(@problem)
  end

  def destroy
    @problem = Problem.find params[:id]
    @problem.destroy
    flash[:notice] = "#{@problem.title} was successfully deleted."
    redirect_to problems_path
end


end
