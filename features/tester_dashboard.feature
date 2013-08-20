Feature: Tester Dashboard
  As a tester
  I want a dashboard displaying details on tests
  So I can earn money taking tests I have not yet taken

  Background:
    Given 2 tests have been created

  Scenario: Dashboard on initial sign up
    Given I have a tester account
      And I am authenticated
    When I navigate to the tester dashboard
    Then I should see 2 tests I have not taken

  Scenario: Dashboard after a test was taken
    Given I have a tester account
      And I am authenticated
      And I note the tests taken count
      And I take the first A/B test I see
    When I navigate to the tester dashboard
    Then I should see tests I have not taken
      And I should not see tests I have taken
      And I should see the tests taken count incremented

  Scenario: Dashboard for test creator
    Given I have a client account
      And I am authenticated
      And I create a test
    When I navigate to the tester dashboard
    Then I should not see the test I created



  # Scenario: Take a test
  #   Given there is 1 test created
  #   When I take the test
  #   Then I should be on the tester dashboard
  #     And I should see the test I took as greyed out
  