Given /^there are carrots, spinach and melon in the shopping list$/ do
  steps %{
    Given there are carrots, spinach and melon in the list of products
  }

  @carrots = Product.find_by_name("carrots")
  @spinach = Product.find_by_name("spinach")
  @melon = Product.find_by_name("melon")

  post add_product_path( @carrots )
  post add_product_path( @spinach )
  post add_product_path( @melon )
end

Given /^there are carrots in the shopping list$/ do
  steps %{
    Given there are carrots in the list of products
  }

  @carrots = Product.find_by_name("carrots")

  post add_product_path( @carrots )
end

Given /^there are no products in the shopping list$/ do
  # nop
end

Given /^there is a product in the shopping list$/ do
  steps %{
    Given there is a product in the list of products
  }

  @product = Product.find_by_name("salad")

  post add_product_path( @product )
end

Given /^the product in not in the shopping list$/ do
  post remove_product_path( @product )
end

When /^I add carrots to the shopping list$/ do
  visit products_path

  within 'tr[data-name="carrots"]' do
    click_link "Add to the shopping list"
  end
end

When /^I add the product to the shopping list$/ do
  visit products_path

  within 'tr[data-name="salad"]' do
    click_link "Add to the shopping list"
  end
end

When /^I remove the product from the shopping list$/ do
  visit products_path

  within 'tr[data-name="salad"]' do
    click_link "Remove from the shopping list"
  end
end

Then /^the shopping list should contain the product$/ do
  Product.in_shopping_list.should include( @product )
end

Then /^the shopping list should not contain the product$/ do
  Product.in_shopping_list.should_not include( @product )
end

Then /^I should have carrots on the shopping list$/ do
  Product.in_shopping_list.should include( @carrots )
end

Then /^carrots should not be duplicated in the shopping list$/ do
  pending # I don't know how to test this.
end

Then /^I should be able to remove the product from the shopping list$/ do
  within 'tr[data-name="salad"]' do
    page.should have_selector('a[title="Remove from the shopping list"][data-method="post"]')
  end
end

Then /^I should not be able to add the product to the shopping list$/ do
  within 'tr[data-name="salad"]' do
    page.should_not have_selector('a[title="Add to the shopping list"][data-method="post"]')
  end
end

Then /^I should be able to add the product to the shopping list$/ do
  within 'tr[data-name="salad"]' do
    page.should have_selector('a[title="Add to the shopping list"][data-method="post"]')
  end
end

Then /^I should not be able to remove the product from the shopping list$/ do
  within 'tr[data-name="salad"]' do
    page.should_not have_selector('a[title="Remove from the shopping list"][data-method="post"]')
  end
end
