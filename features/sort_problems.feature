Feature: display list of practice problems sorted by different topics

  As a berkeley cs student
  So that I can quickly browse problems based on my preferences
  I want to see practice problems sorted by difficulty or type

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  Difficulty settings are "Easy" "Medium" "Hard"
  Given the following practice problems exist:
  | title         | tags         | difficulty| completed? | 
  | 'Alpha Test'  | 'strings'    | 'Medium'  | yes        |
  | 'Beta Test'   | 'recursion'  | 'Hard'    | no         |
  | 'Gamma Test'  | 'lists'      | 'Easy'    | yes        |
  | 'Delta Test'  | 'trees'      | 'Easy'    | no         |


Scenario: sort problems in order of increasing difficulty
  Given I am on the home page
  And I press on "Difficulty"
  Then I should see "Easy" before "Hard"

Scenario: sort problems alphabetically
  Given I am on the home page
  And I press on "Problem"
  Then I should see "Alpha Test" before "Beta Test"
  And I should see "Delta Test" before "Gamma Test"

Scenario: sort problems by difficulty
  Given I am on the home page
  And I press on "Difficulty"
  Then I should see "Gamma Test" before "Beta Test" 
  And I should see "Beta Test" before "Alpha Test"


