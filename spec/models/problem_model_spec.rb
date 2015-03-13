require 'spec_helper'

describe Problem do 

  it "should have no nil attributes" do
    mock_problem = double('Problem')
    mock_problem.stub(:title).and_return('BFS')
    mock_problem.stub(:category).and_return('search')
    mock_problem.stub(:difficulty).and_return('easy')
    mock_problem.stub(:description).and_return('test description')
    mock_problem.stub(:solution).and_return('test solution')

    mock_problem.title.should_not be_nil
    mock_problem.category.should_not be_nil
    mock_problem.difficulty.should_not be_nil
    mock_problem.description.should_not be_nil
    mock_problem.solution.should_not be_nil

  end

end