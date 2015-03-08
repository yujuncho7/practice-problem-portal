class InstructorsController < ApplicationController

  def create
    @user = Instructor.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
  
  def login
    @user = Instructor.find_by_username(params[:email])
    if @user.password == params[:password]
      redirect_to instructor_path
    else
      redirect_to instructor_path
    end
  end

end
