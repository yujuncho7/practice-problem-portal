class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.find :all
  end

  def new
    flash[:notice] = 'ck'
  end

  def create
    instructor = Instructor.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    if instructor.valid?
      flash[:notice] = "Instructor Account Successfully Created!"
      instructor.save!
      redirect_to login_instructors_path
    else
      flash[:notice] = "Invalid Email or Password"
      redirect_to new_instructor_path
    end
  end

  def show
    id = params[:id]
    @instructor = Instructor.find(id)
    #will render app/views/instructors/show.<extension> by default
  end

  def update
    @instructor = ModelHandler.new(Instructor).update(params[:id], params[:instructor])
    flash[:notice] = "#{@instructor.email} was successfully updated."
    redirect_to instructor_path(@instructor)
  end

  def destroy
    @instructor = ModelHandler.new(Instructor).destroy(params[:id])
    flash[:notice] = "#{@instructor.email} was successfully deleted."
    redirect_to instructors_path
  end

  def confirm
    @user = Instructor.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user] = @user
        redirect_to instructor_path(@user)
    else
      flash[:notice] = "Incorrect Username / Password Combinaton"
      redirect_to login_instructors_path
    end
  end

  def login
  end

end
