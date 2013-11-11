Feature: Space-savvy Icon Button and Meaningful Position for Destroy Product Button
  As an user
  In order to save some space on mobile devices and to make more understandable the app
  I want the destroy button in the list of products page to be an icon button and
  to be positioned at the left side of the screen, because the left of the screen is
  a secondary action zone for people who use touch devices with their right hand.

  Scenario: Icon button for destroy product action
    Given there is a product in the list of products
    When I go to the list of products page
    Then I should see the destroy product button
    And the destroy product button should be an icon button
