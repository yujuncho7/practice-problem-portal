Feature: access practice problems

  As a student of UC Berkeley
  So I can improve my grades
  I can access practice problems

Background:

  Given the following practice problems exist:

  | title                 | tags                    | difficulty | completed? | 
  | 'Baby'                | 'lists', 'strings'      | 'average'  | yes        |
  | 'Filter Tree'         | 'trees', 'recursion'    | 'average'  | no         |
  | 'Contains'            | 'trees', 'recursion'    | 'basic'    | yes        |
  | 'Over Nine Thousand'  | 'trees'                 | 'basic'    | no         |
  | 'Numbers Within'      |  'control', 'recursion' | 'advanced' | no         |


Scenario: show problem's solutions
  Given I am on the problem page
  And the 'Toggle' button is unclicked
  And I click the 'Toggle' button
  Then I should see the solutions 
 
Scenario: hide problem's solutions
  Given I am on the problem page
  And the 'Toggle' button is clicked
  And I click the 'Toggle' button
  Then I should not see the solutions 

Scenario: show progress status for each problem
  Given I am on the home page 
  And I have finished 'Baby'
  But I have not finished 'Filter Tree'
  Then the status for 'Baby' is completed 
  But the status for 'Filter Tree' is not completed

Scenario: all tags are selected
  Given I am on the home page
  When I check all possible tags 
  And I press "Refresh"
  Then I should see all the practice prblems

Scenario: filter to problems with 'tree' rating
  Given I am on the home page
  When I check the 'tree' rating
  And I press "Refresh"
  Then I should see 'Filter Tree' 
  And I should see 'Contains'
  But I should see 'Over Nine Thousand'
  But I should not see 'Baby'
  But I should not see  'Numbers Within'
