Feature: allow students to defilter tags

  As a computer science student at UC Berkeley
  I want to be able to clear the selected tags
  So that I can defilter the problems

Background: practice problems have been added to database
  Tabs are named "Problems" "Difficulty"
  Difficulty settings are "Easy" "Medium" "Hard"
  Given the following practice problems exist:
  | title         | tags         | difficulty| completed? | 
  | 'Alpha Test'  | 'Strings'    | 'Medium'  | yes        |
  | 'Beta Test'   | 'Recursion'  | 'Hard'    | no         |
  | 'Gamma Test'  | 'Lists'      | 'Easy'    | yes        |
  | 'Delta Test'  | 'Trees'      | 'Easy'    | no         |

  Given I am on the problems page
  And 'trees' is selected

Scenario: correctly defilters problems when one tag is selected
  Given I am on the problems page
  And 'Trees' is selected
  And I follow 'Unfilter'
  Then I should see 'Alpha Test', 'Beta Test', 'Gamma Test', 'Delta Test'

