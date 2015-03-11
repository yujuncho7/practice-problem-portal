class InstructorsController < ApplicationController

  def index
  end

  def new
    flash[:notice] = 'ck'
  end

  def show
  end

  def create
    @user = Instructor.new(:email => params[:email])
    @user.password = params[:password]
    @user.save!
    flash[:notice] = "Instructor Account Successfully Created!"
    redirect_to login_instructors_path
  end

  def confirm
    @user = Instructor.find_by_email(params[:email])
    if @user.password == params[:password]
      redirect_to instructor_path(@user)
    else
      redirect_to new_instructor_path
    end
  end

  def login
  end

end
