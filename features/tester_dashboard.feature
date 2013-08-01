Feature: Tester Dashboard
  As a tester
  I want a dashboard displaying available tests
  So I can take tests and earn money

  Scenario: Basic dashboard
    Given there are 2 tests created
    When I navigate to the tester dashboard
    Then I should see 2 tests available