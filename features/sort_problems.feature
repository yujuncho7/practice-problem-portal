Feature: display list of practice problems sorted by different topics

  As a berkeley cs student
  So that I can quickly browse problems based on my preferences
  I want to see practice problems sorted by difficulty or type

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  Difficulty settings are "Easy" "Medium" "Hard"

Scenario: sort problems in order increasing difficulty
  Given I am on the home page
  And I press on "Difficulty"
  Then I should see "Easy" before "Hard"

#Assuming Alpha Test and Beta Test are in the database
Scenario: sort problems alphabetically
  Given I am on the home page
  And I press on "Problem"
  Then I should see "Alpha Test" before "Beta Test"
