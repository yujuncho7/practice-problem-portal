Feature: allow admins to submit a practice problem

  As a CS61A instructor
  So that I can help my students
  I want to be able to submit a practice problem

Background: admin is logged in

Scenario: admin submits a problem without a tag
  When I write a problem
  And I submit the problem
  Then I should see "Breadth First Search"

Scenario: admin submits a problem with a tag
  When I write a problem
  And I check the following tags: algorithms
  And I submit the problem
  Then I should see "Djikstras Shortest Path"

Scenario: admin submits an empty textbox without a problem with a tag
  When I check the following tags: algorithms
  And I submit the problem
  Then I should see an error message
  
Scenario: admin submits an empty textbox without a problm without a tag
  When I submit a problem
  Then I should see an error message
