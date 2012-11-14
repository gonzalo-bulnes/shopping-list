Given /^there are no products in the list of products$/ do
end

Given /^there (?:are|is) (\S+) in the list of products$/ do |name|
  @spinach = FactoryGirl.create(:product, name: name)
end

Given /^there are carrots and spinach in the list of products$/ do
  steps %{
    Given there are carrots in the list of products
    And there are spinach in the list of products
  }
end

Given /^there are carrots, spinach and melon in the list of products$/ do
  steps %{
    Given there are carrots in the list of products
    And there are spinach in the list of products
    And there is melon in the list of products
  }
end

When /^I add a product to the list of products$/ do
  visit new_product_path

  fill_in :name, with: "apples"
  click_button "Create Product"
end

When /^I add (\S+) to the list of products$/ do |name|
  visit new_product_path

  fill_in :name, with: name
  click_button "Create Product"
end

When /^I add a product with a blank name to the list of products$/ do
  visit new_product_path

  fill_in :name, with: ""
  click_button "Create Product"
end

When /^I remove the carrots from the list of products$/ do
  visit products_path

  # delete specifically the carrots
  within('tr[data-name="carrots"]') do
    click_link "Destroy"
  end
end

Then /^the list of products should contain the product$/ do
  Product.find_by_name("salad").class == Product
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end

Then /^the list of products should contain (\S+)$/ do |name|
  Product.find_by_name(name).class == Product
end

Then /^the list of products should not contain (\S+)$/ do |name|
  Product.find_by_name(name).should be_nil
end

Then /^I should see carrots, spinach and melon$/ do
  steps %{
    Then I should see "carrots"
    And I should see "spinach"
    And I should see "melon"
  }
end

Then /^(\S+) should not be duplicated in the list of products$/ do |name|
  Product.where( :name => name ).count.should eq 1
end

Then /^the list of products should contain no products$/ do
  Product.count.should eq 0
end