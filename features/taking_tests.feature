Feature: Taking Tests
  As a tester
  I want to be able to take a test
  In order to earn money

  Background:
    Given 1 test has been created
     And I have a tester account
     And I am authenticated

  Scenario: Take an A/B test
    Given I am on the tester dashboard
      And I complete the first A/B test I see
    Then I should be on the tester dashboard
      And the system confirms the test was taken
      And I should not see the test I just took
      And my payout should increase by the proper amount