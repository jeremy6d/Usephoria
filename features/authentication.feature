Feature: Authentication
  As a user
  I want to sign in
  In order to create and take tests tied to my account

  Scenario: Client pages require authentication
    Given I am not authenticated
    When I go to the client dashboard
    Then I should be on the sign in page
      And the flash alert message should be "You need to sign in or sign up before continuing."

  Scenario: Tester pages require authentication
    Given I am not authenticated
    When I go to the tester dashboard
    Then I should be on the sign in page
      And the flash alert message should be "You need to sign in or sign up before continuing."

  Scenario: Client can sign in
    Given I have a client account
      And I am not authenticated
    When I sign in
    Then I should be on the client dashboard

  Scenario: Tester can sign in
    Given I have a tester account
      And I am not authenticated
    When I sign in
    Then I should be on the tester dashboard