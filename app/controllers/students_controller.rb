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
    Student.create(:email => params[:email], :password => params[:password])
    flash[:notice] = "Student Account Successfully Created!"
    redirect_to login_students_path
  end

  def confirm
    @user = Student.find_by_email(params[:email])
    authenticator = UserAuthenticator.new @user
    if authenticator.authenticate(params[:password])
        session[:user] = @user
        redirect_to student_path(@user)
    else
      flash[:notice] = "Incorrect Username / Password Combinaton"
      redirect_to login_students_path
    end
  end

  def update
    @student = ModelHandler.new(Student).update(params[:id], params[:student])
    flash[:notice] = "#{@student.email} was successfully updated."
    redirect_to student_path(@student)
  end

  def login

  end

  def destroy
    @student = ModelHandler.new(Student).destroy(params[:id])
    flash[:notice] = "#{@student.email} was successfully deleted."
    redirect_to students_path
  end

end
