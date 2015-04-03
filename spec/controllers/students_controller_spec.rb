require 'spec_helper'

describe StudentsController do

  it 'should call database to get students' do
    Student.should_receive(:find)
    get :index
  end

  it "should show student by id" do
    mock_student = double('Student')
    Student.should_receive(:find).with('1').and_return(mock_student)
    get :show, {:id => '1'}
  end

  it "should be possible to destroy an student" do
    mock_student = double('Student')
    mock_student.stub(:email)

    Student.should_receive(:find).with('1').and_return(mock_student)
    mock_student.should_receive(:destroy)
    post :destroy, {:id => '1'}
    response.should redirect_to(students_path)
  end

  # it "should be possible to login" do
  #   mock_student = double('Student')
  #   mock_student.stub(:email).and_return('test')
  #   mock_student.stub(:password).and_return('test')
  #   mock_student.stub(:id).and_return(1)
  #   Student.stub(:find_by_email).and_return(mock_student)
  #   post :confirm, {:email => 'test', :password => 'test'}
  #   response.should redirect_to(login_students_path(mock_student))
  # end
  it "should show create student page" do
    get :new
    response.should render_template('new')
  end

  it "should create student if aguments passed" do
    post :create, {:email => 'test@gmail.com', :password => '12345678', :password_confirmation => '12345678' }
    response.should redirect_to(login_students_path)
  end

  it "should not create student if nothing was passed" do
    post :create
    response.should redirect_to(new_student_path)
  end

  it "should not confirm login if incorrect email and password" do
    post :confirm
    response.should redirect_to(login_students_path)
  end

  it "should confirm login if correct email and password" do
    test = Student.create(email:'test@gmail.com', password:'12345678', password_confirmation:'12345678')
    post :confirm, {:email => 'test@gmail.com', :password => '12345678'}
    response.should redirect_to(student_path(test))
  end

  it "should be possible to update an student" do
    mock_student = double('Student')
    mock_student.stub(:update_attributes!)
    mock_student.stub(:email)
    mock_student.stub(:password)

    mock_student_2 = double('Student')

    Student.should_receive(:find).with('1').and_return(mock_student)
    mock_student.should_receive(:update_attributes!)
    post :update, {:id => '1', :problem => mock_student_2}
  end

end

