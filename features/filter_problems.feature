Feature: display list of practice problems sorted by different topics

  As a berkeley cs student
  So that I can quickly browse problems based on my preferences
  I want to see practice problems sorted by difficulty or type

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  Difficulty settings are "Easy" "Medium" "Hard"
  Given the following practice problems exist:
  | title                 | tags                    | difficulty | completed? | 
  | 'Baby'                | 'lists', 'strings'      | 'average'  | yes        |
  | 'Filter Tree'         | 'trees', 'recursion'    | 'average'  | no         |
  | 'Contains'            | 'trees', 'recursion'    | 'basic'    | yes        |
  | 'Over Nine Thousand'  | 'trees'                 | 'basic'    | no         |
  | 'Numbers Within'      |  'control', 'recursion' | 'advanced' | no         |


Scenario: filter problems based on a single tag
  Given I am on the home page
  And I enter 'trees' in tags
  Then I should see 'Filter Tree', 'Contains', 'Over Nine Thousand'

Scenario: filter problems based on no tags
  Given I am on the home page
  And I enter '' in tags
  Then I should see ''
