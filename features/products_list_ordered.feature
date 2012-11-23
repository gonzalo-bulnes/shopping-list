Feature: Ordered List of Products
  As an user
  In order to find the products that I want to add to my shopping list
  I want the list of product to be ordered alphabetically

  Scenario: Display an ordered list
    Given there are carrots, spinach and melon in the list of products
    When I go to the list of products page
    Then "carrots" should be the first item of the list of products
    And "melon" should be the second item of the list of products
    And "spinach" should be the third item of the list of products

  Scenario: Order alphabeticaly without being case sensitive
    Given there are carrots, spinach and Melon in the list of products
    When I go to the list of products page
    Then "carrots" should be the first item of the list of products
    And "Melon" should be the second item of the list of products
    And "spinach" should be the third item of the list of products

  Scenario: Add a product to an ordered list
    Given there are carrots, spinach and melon in the list of products
    When I add red apples to the list of products
    Then "carrots" should be the first item of the list of products
    And "melon" should be the second item of the list of products
    And "red apples" should be the third item of the list of products
    And "spinach" should be the fourth item of the list of products
