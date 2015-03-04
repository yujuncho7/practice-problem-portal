Feature: access practice problems

  As a student of UC Berkeley
  So I can improve my grades
  I can access practice problems

Background:

  Given the following practice problems exist:

  #
  # practice problems preloaded into test DB
  #


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

Scenario: show problem's hints
  Given I am on the problem page
    And the 'Hint' button is unclicked
    And I click the 'Hint' button
  Then I should see the hints

Scenario: hide problem's hints
  Given I am on the problem page
    And the 'Hint' button is clicked
    And I click the 'Hint' button
  Then I should not see the hints

#
# fill in with actual DB entry
#

Scenario: show progress status for each problem
  Given I am on the home page 
    And I have finished #problem 1
    But I have not finished #problem 2
  Then the status for #problem 1 is done 
    But the status for #problem 2 is not done

Scenario: all tags are selected
  Given I am on the home page
  When I check all possible tags 
    And I press "Refresh"
  Then I should see all the practice prblems

Scenario: filter to problems with 'tree' rating
  Given I am on the home page
  When I check the 'tree' rating
    And I press "Refresh"
  Then I should see #problem with 'tree' rating
    And I should see #problem with 'tree' rating
    But I should not see #problem without 'tree' rating
    But I should not see #problem without 'tree' rating