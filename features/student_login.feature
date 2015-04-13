Feature: allow students to login to the portal

  As a CS61A student
  So that I can enter the portal
  I want to be able to login

Background: users have been added to database

  Given the following students exist:
  | email               | password        | password_confirmation |
  | bob@gmail.com       | 1234123456      | 1234123456            |
  | hello@gmail.com     | world123546     | world123546           |

  And I am on the student login page

Scenario: input valid username but not password
  When I fill in "Email" with "bob@gmail.com"
  And I fill in "Password" with "123412356"
  And I press "Log in"
  Then I should be on the student login page
  Then I should see "Invalid email or password"

Scenario: input valid password but not username
  When I fill in "Email" with "daniel"
  And I fill in "Password" with "1234"
  And I press "Log in"
  Then I should be on the student login page
  Then I should see "Invalid email or password"

Scenario: input valid password and username
  When I fill in "Email" with "bob@gmail.com"
  And I fill in "Password" with "1234123456"
  And I press "Log in"
  Then I should see "You have to confirm your email address before continuing."

Scenario: input invalid password and username
  When I fill in "Email" with "124p09u"
  And I fill in "Password" with "asdawe"
  And I press "Log in"
  Then I should be on the student login page
  Then I should see "Invalid email or password"

Scenario: input empty password and username
  When I fill in "Email" with ""
  And I fill in "Password" with ""
  And I press "Log in"
  Then I should be on the student login page
  Then I should see "Invalid email or password"

