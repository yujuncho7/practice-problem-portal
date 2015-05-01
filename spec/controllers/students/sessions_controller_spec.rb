require 'spec_helper'

describe Students::SessionsController do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:student]
  end
  it "should be possible to login" do
    get :new
  end
  it "should be possible to create" do
    post :create
  end
  it "should be possible to view current problems status" do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:id).and_return("1")
    student.stub(:confirmed?).and_return(true)
    problems = Hash.new
    problems["test"] = "Completed"
    student.stub(:completed_problems).and_return(problems)
    sign_in student
    get :profile, { :id => "1" }
  end
  it "should be possible to view current problems status" do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:id).and_return("1")
    student.stub(:confirmed?).and_return(true)
    student.stub(:completed_problems).and_return(Hash.new)
    get :profile, { :id => "1" }
    response.should redirect_to(new_student_session_path)
  end

end
