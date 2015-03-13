class StudentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @user = Student.new(:email => params[:email])
    @user.password = params[:password]
    @user.save!
    flash[:notice] = "Student Account Successfully Created!"
    redirect_to login_students_path
  end

  def confirm
    @user = Student.find_by_email(params[:email])
    if @user.nil?
      flash[:notice] = "Incorrect Username / Password Combinaton"
      redirect_to login_students_path
    else
      if @user.password == params[:password]
        redirect_to student_path(@user)
      else
        flash[:notice] = "Incorrect Username / Password Combinaton"
        redirect_to login_students_path
      end
    end
  end

  def login
  end

end
