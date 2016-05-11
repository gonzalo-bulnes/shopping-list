Feature: Public Pages
  As a visitor
  In order to know what the app is about
  I want to see an informative page

  Scenario:
    Given I am not signed in
    When I visit the Shopping List
    Then I see a landing page

