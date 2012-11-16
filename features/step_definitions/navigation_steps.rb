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
  visit new_product_path
end

When /^I go to the list of products page$/ do
  visit products_path
end

When /^I go to the shopping list page$/ do
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
