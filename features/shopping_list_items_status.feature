Feature: Manage the Shopping List Items Status
  As an user
  I want to know if the products in my shopping list are "pending" or "done"
  In order to know how much I've progressed in my shopping

  Scenario: Default status
    Given there are no products in the shopping list
    And there are carrots in the list of products
    When I add carrots to the shopping list
    Then the carrots status should be "pending"

  Scenario: Toggle the status of a pending item
    Given there are carrots in the shopping list
    And the carrots status is "pending"
    When I toggle the carrots status
    Then the carrots status should be "done"

  Scenario: Toggle the status of a done item
    Given there are spinach in the shopping list
    And the spinach status is "done"
    When I toggle the spinach status
    Then the spinach status should be "pending"
