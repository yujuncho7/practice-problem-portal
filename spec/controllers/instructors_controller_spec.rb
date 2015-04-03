require 'spec_helper'

describe InstructorsController do

  it 'should call database to get instructors' do
    Instructor.should_receive(:find)
    get :index
  end

  it "should show instructor by id" do
    mock_instructor = double('Instructor')
    Instructor.should_receive(:find).with('1').and_return(mock_instructor)
    get :show, {:id => '1'}
  end

  it "should be possible to destroy an instructor" do
    mock_instructor = double('Instructor')
    mock_instructor.stub(:email)

    Instructor.should_receive(:find).with('1').and_return(mock_instructor)
    mock_instructor.should_receive(:destroy)
    post :destroy, {:id => '1'}
    response.should redirect_to(instructors_path)
  end

  # it "should be possible to login" do
  #   mock_instructor = double('Instructor')
  #   mock_instructor.stub(:email).and_return('test')
  #   mock_instructor.stub(:password).and_return('test')
  #   mock_instructor.stub(:id).and_return(1)
  #   Instructor.stub(:find_by_email).and_return(mock_instructor)
  #   post :confirm, {:email => 'test', :password => 'test'}
  #   response.should redirect_to(instructors_path(mock_instructor))
  # end
  it "should show create instructor page" do
    get :new
    response.should render_template('new')
  end

  it "should create instructor if aguments passed" do
    post :create, {:email => 'test@gmail.com', :password => '12345678', :password_confirmation => '12345678' }
    response.should redirect_to(login_instructors_path)
  end

  it "should not create instructor if nothing was passed" do
    post :create
    response.should redirect_to(new_instructor_path)
  end

  it "should not confirm login if incorrect email and password" do
    post :confirm
    response.should redirect_to(login_instructors_path)
  end

  it "should confirm login if correct email and password" do
    test = Instructor.create(email:'test@gmail.com', password:'12345678', password_confirmation:'12345678')
    post :confirm, {:email => 'test@gmail.com', :password => '12345678'}
    response.should redirect_to(instructor_path(test))
  end
  
  it "should be possible to update an instructor" do
    mock_instructor = double('Instructor')
    mock_instructor.stub(:update_attributes!)
    mock_instructor.stub(:email)
    mock_instructor.stub(:password)

    mock_instructor_2 = double('Instructor')

    Instructor.should_receive(:find).with('1').and_return(mock_instructor)
    mock_instructor.should_receive(:update_attributes!)
    post :update, {:id => '1', :problem => mock_instructor_2}
  end

end
