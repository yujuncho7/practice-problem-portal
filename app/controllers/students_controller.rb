class StudentsController < ApplicationController

  def new
  end

  def index
    redirect_to login_students_path
  end

  def show
  end

  def create
    @user = Student.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = Student.find_by_username(params[:email])
    if @user.password == params[:password]
      #this needs to be changed!!!
      redirect_to instructor_path
    else
      #this needs to be changed!!!!
      redirect_to instructor_path
    end
  end
end
