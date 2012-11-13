Feature: List of Products
  As an user
  I want to maintain a list of products
  So I can pick products to write muy buy list faster

  Scenario: Create a product
    Given there are no products in the list of products
    When I add a product to the list of products
    Then the list of products should contain the product
    And I should see "The new product was successfully created."

  Scenario: Delete a product
    Given there are carrots and spinach in the list of products
    When I remove the carrots from the list of products
    Then the list of products should not contain carrots
    And the list of products should contain spinach

  Scenario: List products
    Given there are carrots, spinach and melon in the list of products
    When I go to the list of products page
    Then I should see carrots, spinach and melon

  Scenario: Create a duplicated product
    Given there are spinach in the list of products
    When I add spinach to the list of products
    Then I should see "This product has already been created."
    And the list of products should contain spinach
    And spinach should not be duplicated in the list of products