Given /^there are no products in the list of products$/ do
end

Given /^there are carrots and spinach in the list of products$/ do
  @carrots = FactoryGirl.create(:product, name: "carrots")
  @spinach = FactoryGirl.create(:product, name: "spinach")
end

Given /^there are (\S+) in the list of products$/ do |name|
  @spinach = FactoryGirl.create(:product, name: name)
end

Given /^there are carrots, spinach and melon in the list of products$/ do
  @carrots = FactoryGirl.create(:product, name: "carrots")
  @spinach = FactoryGirl.create(:product, name: "spinach")
  @melon = FactoryGirl.create(:product, name: "melon")
end

When /^I add a product to the list of products$/ do
  visit new_product_path

  fill_in :name, with: "apples"
  click_button "Create Product"
end

When /^I add spinach to the list of products$/ do
  visit new_product_path

  fill_in :name, with: "spinach"
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

Then /^the list of products should not contain carrots$/ do
  Product.find_by_name("carrots").class == Product
end

Then /^the list of products should contain spinach$/ do
  Product.find_by_name("spinach").class == Product
end

Then /^I should see carrots, spinach and melon$/ do
  page.should have_content "carrots"
  page.should have_content "spinach"
  page.should have_content "melon"
end

Then /^spinach should not be duplicated in the list of products$/ do
  Product.where( :name => "spinach" ).count.should eq 1
end

Then /^the list of products should contain no products$/ do
  Product.count.should eq 0
end