Given /^the (\S+) status is "(.*?)"$/ do |product_name, status|
  @shopping_list.products.where(name: product_name).pop.status!( status )
end

When /^I toggle the carrots status$/ do
  steps %{
    When I go to the shopping list page
  }

  # The name, title of the link which toggles the shopping list item status
  # should vary according to the current status. That makes the use of
  # the `click_link` impossible. The following line should replace it.
  page.find('tr[data-name="carrots"] a[data-action="toggle-shopping-list-item-status"]').click
end

When /^I toggle the spinach status$/ do
  steps %{
    When I go to the shopping list page
  }

  # The name, title of the link which toggles the shopping list item status
  # should vary according to the current status. That makes the use of
  # the `click_link` impossible. The following line should replace it.
  page.find('tr[data-name="spinach"] a[data-action="toggle-shopping-list-item-status"]').click
end

Then /^the (\S+) status should be "(.*?)"$/ do |product_name, status|
  @shopping_list.products.where(name: product_name).pop.status.should eq status
end
