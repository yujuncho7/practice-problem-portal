class StudentsController < ApplicationController

  def index
    @students = Student.find :all
  end

  def new
  end

  def show
    id = params[:id]
    @student = Student.find(id)
  end

  def create
    student = Student.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    if student.valid?
      flash[:notice] = "Student Account Successfully Created!"
      student.save!
      redirect_to login_students_path
    else
      flash[:notice] = "Invalid Email or Password"
      redirect_to new_student_path
    end
  end

  def confirm
    @user = Student.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user] = @user
        redirect_to student_path(@user)
    else
      flash[:notice] = "Incorrect Username / Password Combinaton"
      redirect_to login_students_path
    end
  end

  def update
    @student = Student.find params[:id]
    @student.update_attributes!(params[:student])
    flash[:notice] = "#{@student.email} was successfully updated."
    redirect_to student_path(@student)
  end

  def login

  end

  def destroy
    @student = Student.find params[:id]
    @student.destroy
    flash[:notice] = "#{@student.email} was successfully deleted."
    redirect_to students_path
  end

end
