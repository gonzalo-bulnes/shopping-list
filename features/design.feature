Feature: App Design
  As an user
  I want the app to have great buttons and color
  In order to make it easier to undertand, more intuitive and comfortable to use

  @icon-star @current
  Scenario: Icon button for remove product to the shopping list toggle action
    Given there is a product in the shopping list
    When I go to the list of products page
    Then the "Remove from the shopping list" button should have a star icon

  @icon-star @current
  Scenario: Icon button for add product to the shopping list toggle action
    Given there are no products in the shopping list
    And there is a product in the list of products
    When I go to the list of products page
    Then the "Add to the shopping list" button should have an empty star icon