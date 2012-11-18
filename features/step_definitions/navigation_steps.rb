Given /^I am anywhere$/ do
  # no conditiond
end

Given /^I am on the shopping list page$/ do
  steps %{
    When I go to the shopping list page
  }
end

Given /^I am on the list of products page$/ do
  steps %{
    When I go to the list of products page
  }
end

Given /^I am on the new product page$/ do
  steps %{
    When I go to the new product page
  }
end

# Note: having a shopping list is required by almost any view,
# that's why all the 'when' navigation steps include that requirement.
# That's also why 'given' steps are redirected to 'when' steps.

When /^I go to the new product page$/ do
  steps %{
    Given there is a shopping list
  }

  visit new_product_path
end

When /^I go to the home page$/ do
  steps %{
    Given there is a shopping list
  }
  
  visit root_path
end

When /^I go to the list of products page$/ do
  steps %{
    Given there is a shopping list
  }

  visit products_path
end

When /^I go to the shopping list page$/ do
  steps %{
    Given there is a shopping list
  }
  
  visit shopping_list_path
end

Then /^I should be able to go to the shopping list page$/ do
  page.should have_selector('a[title="Go to the shopping list"]')
end

Then /^I should be able to go to the new product page$/ do
  page.should have_selector('a[title="Create a new product"]')
end

Then /^I should be able to go to the list of products page$/ do
  page.should have_selector('a[title="Go to the list of products"]')
end

Then /^I should see the shopping list page$/ do
  page.should have_selector('h1', text: "Shopping List")
end
