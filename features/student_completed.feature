Feature: display whether or not a problem was been completed by the student

  As a berkeley cs student
  So that I can keep track of my practice progress
  I want to see if I have completed a problem or not

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  
  Given the following practice problems exist:
  | title         | difficulty|
  | "Alpha Test"  | "Medium"  |
  | "Beta Test"   | "Hard"    | 

  Given the following students exist:
  | student     | completed_problems |
  | "StudentA"  | {"Alpha Test" => true, "Beta Test" => true} |
  | "StudentB"  | {"Alpha Test" => false, "Beta Test" => false} |
  | "StudentC"  | {"Alpha Test" => true, "Beta Test" => false} |

  Given I am on the problems page

  Scenario: the student has completed all problems
    Given I am the student named "StudentA"
    Then I should see "Yes"
    But I should not see "No"


  Scenario: the student has completed some problems
    Given I am the student named "StudentC"
    Then I should see "Yes" before "No"


  Scenario: the student has not completed any problems
    Given I am the student named "StudentB"
    Then I should see "No"
    But I should not see "No"
