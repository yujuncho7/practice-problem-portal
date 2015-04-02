class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.find :all
  end

  def new
    flash[:notice] = 'ck'
  end

  def create
    Instructor.create(:email => params[:email], :password => params[:password])
    flash[:notice] = "Instructor Account Successfully Created!"
    redirect_to login_instructors_path
  end

  def show
    id = params[:id]
    @instructor = Instructor.find(id)
    #will render app/views/instructors/show.<extension> by default
  end

  def update
    @instructor = Instructor.find params[:id]
    @instructor.update_attributes!(params[:instructor])
    flash[:notice] = "#{@instructor.email} was successfully updated."
    redirect_to instructor_path(@instructor)
  end

  def destroy
    @instructor = Instructor.find params[:id]
    @instructor.destroy
    flash[:notice] = "#{@instructor.email} was successfully deleted."
    redirect_to instructors_path
  end

  def confirm
    @user = Instructor.find_by_email(params[:email])
    if @user.nil?
      flash[:notice] = "Incorrect Username / Password Combinaton"
      redirect_to login_instructors_path
    else
      if @user.password == params[:password]
        session[:user] = @user
        redirect_to instructor_path(@user)
      else
        flash[:notice] = "Incorrect Username / Password Combinaton"
        redirect_to login_instructors_path
      end
    end
  end

  def login
  end

end
