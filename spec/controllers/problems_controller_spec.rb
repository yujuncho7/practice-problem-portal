require 'spec_helper'

describe ProblemsController do 

  it 'should call database to get problems' do
    Problem.should_receive(:find)
    get :index
  end

  it "should show problem by id" do
    mock_problem = double('Problem')
    Problem.should_receive(:find).with('1').and_return(mock)
    get :show, {:id => '1'}
  end

  it "should be possible to destroy problem" do
    mock_problem = double('Problem')
    mock_problem.stub(:title)

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