Feature: allow admins to login to the portal

  As a CS61A instructor
  So that I can enter the portal
  I want to be able to login

Background: users have been added to database

  Given the following instructors exist:
  | email     | password  |
  | bob       | 1234      |
  | hello     | world     |

  And I am on the instructor login page

Scenario: input valid username but not password
  When I fill in "email" with "bob"
  And I fill in "Password" with "13twtbasf"
  And I press "Submit"
  Then I should be on the instructor login page
  Then I should see "Incorrect Username / Password Combinaton"

Scenario: input valid password but not username
  When I fill in "email" with "daniel"
  And I fill in "Password" with "1234"
  And I press "Submit"
  Then I should be on the instructor login page
  Then I should see "Incorrect Username / Password Combinaton"

Scenario: input valid password and username
  When I fill in "email" with "bob"
  And I fill in "Password" with "1234"
  And I press "Submit"
  Then I should be on the instructor home page for "bob"

Scenario: input invalid password and username
  When I fill in "email" with "124p09u"
  And I fill in "Password" with "asdawe"
  And I press "Submit"
  Then I should be on the instructor login page
  Then I should see "Incorrect Username / Password Combinaton"

Scenario: input empty password and username
  When I fill in "email" with ""
  And I fill in "Password" with ""
  And I press "Submit"
  Then I should be on the instructor login page
  Then I should see "Incorrect Username / Password Combinaton"
