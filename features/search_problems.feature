Feature: Display list of practice problems given a title query  

  As a berkeley cs student
  So that I can quickly browse problems based on my preferences
  I want to see practice problems that match a given title query

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  Difficulty settings are "Easy" "Medium" "Hard"
  Given the following practice problems exist:
  | title                 | tags                    | difficulty | completed? | 
  | 'Baby'                | 'lists', 'strings'      | 'average'  | yes        |
  | 'Filter Tree'         | 'trees', 'recursion'    | 'average'  | no         |
  | 'Contains'            | 'trees', 'recursion'    | 'basic'    | yes        | 
  | 'Over Nine Thousand'  | 'trees'                 | 'basic'    | no         |
  | 'Numbers Within'      | 'control', 'recursion'  | 'advanced' | no         |


Scenario: Search a problem given title query 
  Given I am on the problems page
  And I enter 'Baby' in search_problems
  Then I should see 'Baby'

Scenario: Search problem given no query
  Given I am on the problems page
  And I enter '' in search_problems 
  Then I should see 'Baby', 'Filter Tree', 'Contains', 'Over Nine Thousand', 'Numbers Within'
