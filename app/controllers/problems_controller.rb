class ProblemsController < ApplicationController

  def index
    if (!student_signed_in? and !instructor_signed_in?)
      redirect_to new_student_session_path
    end
    @search = Problem.search(params[:q])
    # this is for tagging
    if params[:tag]
      @problems = Problem.tagged_with(params[:tag])
    else
      @problems = @search.result
    end
    if (student_signed_in?)
      @completion_hash = current_student.completed_problems
      if @completion_hash == nil
        current_student.completed_problems = Hash.new
        current_student.save
      end
    end
  end

  def new
    if !instructor_signed_in?
      redirect_to problems_path
      flash[:notice] = "Permission Denied"
    end
  end

  def show
    require 'coderay'
    id = params[:id]
    @problem = Problem.find(id)
    if(student_signed_in?)
      @completion_hash = current_student.completed_problems
    end
    renderer = Redcarpet::Render::HTML.new(hard_wrawp: true, prettify: true)
    @markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    #will render app/views/problems/show.<extension> by default
  end

  def create
    @problem = Problem.create!(params[:problem])
    flash[:notice] = "#{@problem.title} was successfully created."
    redirect_to problems_path #make sure this is the right route
  end

  def complete
    @completion_hash = current_student.completed_problems
    if (params[:complete] == "1")
      @completion_hash[params[:problem]] = "Complete"
    else
      @completion_hash[params[:problem]] = "In Progress"
    end
    current_student.completed_problems = @completion_hash
    current_student.save
    redirect_to problems_path
  end

  def edit
    if instructor_signed_in?
        @problem = Problem.find params[:id]
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
