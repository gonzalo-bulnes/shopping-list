Feature: App-Wide Announcements
  As an user
  In order to feel the app developers care about me
  I want tp see new features, scheduled maintenance periods and
  great news announced while I use the app. I also want to dismiss
  the announcement when I've read it.

  Scenario: Display announcement in the shopping list page
    Given there is an announcement
    When I go to the shopping list page
    Then I should see the announcement

  Scenario: Display announcement in the list of products page
    Given there is an announcement
    When I go to the list of products page
    Then I should see the announcement

  Scenario: Scheduled announcement
    Given there is an announcement scheduled in the future
    When I go to the shopping list page
    Then I should not see the announcement

  Scenario: Outdated announcement
    Given there is an outdated announcement
    When I go to the shopping list page
    Then I should not see the announcement

  Scenario: Dismiss announcement
    Given there is an announcement
    And I am on the shopping list page
    When I dismiss the announcement
    Then I should not see the announcement
    And I should not see the announcement on the list of products page
