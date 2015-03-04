Feature: access practice problems

	As a student of UC Berkeley
	So I can improve my grades
	I can access practice problems


Background:
	


Scenario: toggle problem's solutions
	Given I am on the problem page

Scenario: toggling hints and explanations
	Given I am on the problem page


Scenario: show progress status for each problem


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
		And I should not see #problem without 'tree' rating
		And I should not see #problem without 'tree' rating


