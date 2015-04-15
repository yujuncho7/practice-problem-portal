require 'spec_helper'

describe ProblemsController do

  it 'should call database to get problems if not signed in' do
    p = Problem.create
    get :index
    response.should redirect_to(new_student_session_path) 
  end

  it 'should call database to get problems if signed in' do
    instructor = FactoryGirl.create(:instructor)
    instructor.confirm!
    instructor.stub(:active?).and_return(true)
    instructor.stub(:confirmed?).and_return(true)
    sign_in instructor
    p = Problem.create
    get :index
    response.should render_template("index")
  end

  it 'should create new completed problems hash if student signed in' do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:confirmed?).and_return(true)
    sign_in student
    get :index
    response.should render_template("index")
  end



  it "should show problem by id" do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:confirmed?).and_return(true)
    sign_in student
    mock_problem = double('Problem')
    Problem.should_receive(:find).with('1').and_return(mock_problem)
    get :show, {:id => '1'}
  end

  it "should show new problem template if instructor" do
    instructor = FactoryGirl.create(:instructor)
    instructor.confirm!
    instructor.stub(:active?).and_return(true)
    instructor.stub(:confirmed?).and_return(true)
    sign_in instructor
    post :new
    response.should render_template('new')
  end

  it "should redirect to problem page if not instructor" do
    post :new
    response.should redirect_to(problems_path)
  end

  it "should show edit page if instructor" do
    mock_problem = double('Problem')
    Problem.should_receive(:find).with('1').and_return(mock_problem)
    instructor = FactoryGirl.create(:instructor)
    instructor.confirm!
    instructor.stub(:active?).and_return(true)
    instructor.stub(:confirmed?).and_return(true)
    sign_in instructor
    get :edit, { :id => '1' }
    response.should render_template('edit')
  end

  it "should not show edit page if not instructor" do
    get :edit, { :id => '1'}
    response.should redirect_to(problems_path)
  end


  it "should be possible to destroy problem" do
    mock_problem = double('Problem')
    mock_problem.stub('title')

    Problem.should_receive(:find).with('1').and_return(mock_problem)
    mock_problem.should_receive(:destroy)
    post :destroy, {:id => '1'}
    response.should redirect_to(problems_path)
  end

  it "should be possible to create problem" do
    mock_problem = double('Problem')
    mock_problem.stub(:title)

    Problem.should_receive(:create!).and_return(mock_problem)
    post :create, {:problem => mock_problem}
    response.should redirect_to(problems_path)
  end

  it "should be possible to complete problem" do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:confirmed?).and_return(true)
    student.stub(:completed_problems).and_return(Hash.new)
    sign_in student
    post :complete, { complete: "1", problem: "2sum", id: "1"}
    response.should redirect_to(problems_path)
  end

  it "should be possible to complete problem" do
    student = FactoryGirl.create(:student)
    student.confirm!
    student.stub(:active?).and_return(true)
    student.stub(:confirmed?).and_return(true)
    student.stub(:completed_problems).and_return(Hash.new)
    sign_in student
    post :complete, { complete: "0", problem: "2sum", id: "1"}
    response.should redirect_to(problems_path)
  end


  it "should be possible to update a problem" do
    mock_problem = double('Problem')
    mock_problem.stub(:update_attributes!)
    mock_problem.stub(:title)
    mock_problem.stub(:difficulty)

    mock_problem_2 = double('Problem')

    Problem.should_receive(:find).with('1').and_return(mock_problem)
    mock_problem.should_receive(:update_attributes!)
    post :update, {:id => '1', :problem => mock_problem_2}
  end

end
