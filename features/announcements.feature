Feature: App-Wide Announcements
  As an user
  In order to feel the app developers care about me
  I want tp see new features, scheduled maintenance periods and
  great news announced while I use the app. I also want to dismiss
  the announcement when I've read it.

  @current
  Scenario: Display annoucement in the shopping list page
    Given there is an annoucement
    When I go to the shopping list page
    Then I should see the annoucement

  @current
  Scenario: Display annoucement in the list of products page
    Given there is an annoucement
    When I go to the list of products page
    Then I should see the annoucement

  @current
  Scenario: Scheduled annoucement
    Given there is an annoucement scheduled in the future
    When I go to the shopping list page
    Then I should not see the annoucement

  @current
  Scenario: Outdated annoucement
    Given there is an outadted annoucement
    When I go to the shopping list page
    Then I should not see the annoucement
