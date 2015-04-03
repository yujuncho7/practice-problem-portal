require 'spec_helper'

describe ProblemsController do

  it 'should call database to get problems' do
    p = Problem.create
    get :index
    expect(response).to render_template("index")
  end

  it "should show problem by id" do
    mock_problem = double('Problem')
    Problem.should_receive(:find).with('1').and_return(mock_problem)
    get :show, {:id => '1'}
  end

  it "should show new problem template" do
    test = Instructor.create(email:'test@gmail.com', password:'12345678', password_confirmation:'12345678')
    session[:user] = test
    post :new
    response.should render_template('new')
  end

  it "should redirect to problem page if not instructor" do
    post :new
    response.should redirect_to(problems_path)
  end

  it "should show edit page if instructor" do
    test = Instructor.create(id:'1', email:'test@gmail.com', password:'12345678', password_confirmation:'12345678')
    Problem.create(id:'1', title:'test')
    session[:user] = test
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
