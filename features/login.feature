Feature: allow admins to login to the portal

  As a CS61A instructor
  So that I can enter the portal
  I want to be able to login

Background: users have been added to database

  Given the following users exist:
  | username  | password  |
  | bob       | 1234      |
  | hello     | world     |

  And I am on the login page

Scenario: input valid username but not password
  When I fill in "Username" with "bob"
  And I fill in "Password" with "13twtbasf"
  And I press "Login"
  Then I should be on the login page
  Then I should see "ERROR"

Scenario: input valid password but not username
  When I fill in "Username" with "daniel"
  And I fill in "Password" with "1234"
  And I press "Login"
  Then I should be on the login page
  Then I should see "ERROR"

Scenario: input valid password and username
  When I fill in "Username" with "bob"
  And I fill in "Password" with "1234"
  And I press "Login"
  Then I should be on the home page

Scenario: input invalid password and username
  When I fill in "Username" with "124p09u"
  And I fill in "Password" with "asdawe"
  And I press "Login"
  Then I should be on the login page
  Then I should see "ERROR"

Scenario: input empty password and username
  When I fill in "Username" with ""
  And I fill in "Password" with ""
  And I press "Login"
  Then I should be on the login page
  Then I should see "ERROR"
