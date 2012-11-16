Given /^there are carrots, spinach and melon in the shopping list$/ do
  steps %{
    Given there are carrots, spinach and melon in the list of products
  }

  @carrots = Product.find_by_name("carrots")
  @spinach = Product.find_by_name("spinach")
  @melon = Product.find_by_name("melon")

  add_product_path( @carrots )
  add_product_path( @spinach )
  add_product_path( @melon )
end

Given /^there are carrots in the shopping list$/ do
  steps %{
    Given there are carrots in the list of products
  }

  @carrots = Product.find_by_name("carrots")

  add_product_path( @carrots )
end

Given /^there are no products in the shopping list$/ do
  # nop
end

Given /^there is a product in the shopping list$/ do
  steps %{
    Given there is a product in the list of products
  }

  @product = Product.find_by_name("salad")

  add_product_path( @product )
end

When /^I add carrots to the shopping list$/ do
  visit products_path

  within 'tr[data-name="carrots"]' do
    click_button "Add to the shopping list"
  end
end

When /^I add the product to the shopping list$/ do
  visit products_path

  within 'tr[data-name="#{ @product.name }"]' do
    click_button "Add to the shopping list"
  end
end

When /^I remove the product from the shopping list$/ do
  visit products_path

  within 'tr[data-name="salad"]' do
    click_button "Remove from the shopping list"
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
