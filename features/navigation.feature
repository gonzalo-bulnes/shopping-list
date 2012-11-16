Feature: Navigation
  As an user
  In order to make the app usablility acceptable
  I want to be able to navigate from any page of the app to any other
  with no more than two clicks

  @current
  Scenario: Navigate from the shopping list
    Given I am on the shopping list page
    Then I should be able to go to the list of products page

  @current
  Scenario: Navigate from the list of products
    Given I am on the list of products page
    Then I should be able to go to the shopping list page
    And I should be able to go to the new product page

  @current
  Scenario: Navigate from the new product page
    Given I am on the new product page
    Then I should be able to go to the list of products page