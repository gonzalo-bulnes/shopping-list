Feature: Shopping List
  As an user
  I want to group products
  In order to create a shopping list

  Scenario: Show the shopping list
    Given there are carrots, spinach and melon in the shopping list
    When I go to the shopping list page
    Then I should see carrots, spinach and melon

  Scenario: Add a product to the shopping list
    Given there are no products in the shopping list
    And there is a product in the list of products
    When I add the product to the shopping list
    Then the shopping list should contain the product

  Scenario: Remove a product from the shopping list
    Given there is a product in the shopping list
    When I remove the product from the shopping list
    Then the shopping list should not contain the product

  Scenario: Add a product which is already on the shopping list
    Given there are carrots in the shopping list
    When I add carrots to the shopping list
    Then I should have carrots on the shopping list
    And carrots should not be duplicated in the shopping list