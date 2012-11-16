Given /^there are carrots, spinach and melon in the shopping list$/ do
  steps %{
    Given there are carrots, spinach and melon in the list of products
  }

  @carrots = Product.find_by_name("carrots")
  @spinach = Product.find_by_name("spinach")
  @melon = Product.find_by_name("melon")

  ShoppingList.add( @carrots )
  ShoppingList.add( @spinach )
  ShoppingList.add( @melon )

end

Given /^there are carrots in the shopping list$/ do
  steps %{
    Given there are carrots in the list of products
  }

  @carrots = Product.find_by_name("carrots")

  ShoppingList.add( @carrots )
end

Given /^there are no products in the shopping list$/ do
  # nop
end

Given /^there is a product in the shopping list$/ do
  steps %{
    Given there is a product in the list of products
  }

  @product = Product.find_by_name("salad")

  ShoppingList.add( @product )
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
  ShoppingList.contains?( @product ).should be_true
end

Then /^the shopping list should not contain the product$/ do
  ShoppingList.contains?( @product ).should be_false
end

Then /^I should have carrots on the shopping list$/ do
  ShoppingList.contains?( @product ).should be_true
end

Then /^carrots should not be duplicated in the shopping list$/ do
  pending # I don't know how to test this.
end
