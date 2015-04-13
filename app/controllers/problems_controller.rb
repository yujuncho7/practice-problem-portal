class ProblemsController < ApplicationController

  def index
    if (!student_signed_in? and !instructor_signed_in?)
      redirect_to new_student_session_path
    end
    @search = Problem.search(params[:q])
    @problems = @search.result
  end

  def new
    if !instructor_signed_in? 
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
    modelHandler = ModelHandler.new(Problem)
    @problem = modelHandler.update(params[:id], params[:problem])
    flash[:notice] = "#{@problem.title} was successfully updated."
    redirect_to problem_path(@problem)
  end

  def destroy
    modelHandler = ModelHandler.new(Problem)
    modelHandler.destroy(params[:id])
    flash[:notice] = "Problem was successfully deleted."
    redirect_to problems_path
  end

end
