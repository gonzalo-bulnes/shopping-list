Feature: Quick Feedback
  As an user
  In order to get quick feedback about the presence of products in
  the shopping list
  I want to add (resp. remove) items to (resp. from) the shopping list
  via a toggle button in the list of products

  @current
  Scenario: Default action for products in the shopping list
    Given there is a product in the shopping list
    When I go to the list of products page
    Then I should be able to remove the product from the shopping list
    And I should not be able to add the product to the shopping list

  @current
  Scenario: Default action for products outside the shopping list
    Given there is a product in the list of products
    And the product in not in the shopping list
    When I go to the list of products page
    Then I should be able to add the product to the shopping list
    And I should not be able to remove the product from the shopping list