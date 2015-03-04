Feature: upload practice problems 
  As an instructor at UC Berkeley
  So that my students can get better grades
  I can submit practice problems

Background:
  Given the following practice problems exist:
	#
	# practice problems preloaded into test DB
	#

	And I am on the "Upload Page"

Scenario: choose tags associated with the new problem
  Then I should a list of tags 
	Then I should be able to select the necessary tags

Scenario: upload practice problem
	Then I should be able to select a problem file
	Then I should be able to click upload 

