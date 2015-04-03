class ProblemsController < ApplicationController

  def index
    @search = Problem.search(params[:q])
    @problems = @search.result
  end

  def new
    user = session[:user]
    if !user.nil? 
      if user.is_instructor?
        # automatically renders view template corresponding to new method
      end
    else
      redirect_to problems_path
      flash[:notice] = "Permission Denied"
    end
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
    user = session[:user]
    if !user.nil? 
      if user.is_instructor?
        @problem = Problem.find params[:id]
      end
    else
      flash[:notice] = "Permission Denied"
      redirect_to problems_path
    end
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
