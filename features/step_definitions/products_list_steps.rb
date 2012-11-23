Given /^there are no products in the list of products$/ do
end

Given /^there (?:are|is) (\S+) in the list of products$/ do |name|
  FactoryGirl.create(:product, name: name)
end

Given /^there is a product in the list of products$/ do
  steps %{
    Given there is salad in the list of products
  }

  @product = Product.find_by_name("salad")
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

When /^I add ((?:\S+ \S+)|(?:\S+)) to the list of products$/ do |name|
  steps %{
    When I go to the new product page
  }

  # the default product is salad
  name = "salad" if name == "a product"

  fill_in :name, with: name
  click_button "Create Product"
end

When /^I add a product with a blank name to the list of products$/ do
  steps %{
    When I go to the new product page
  }

  fill_in :name, with: ""
  click_button "Create Product"
end

When /^I remove the carrots from the list of products$/ do
  steps %{
    When I go to the list of products page
  }

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

Then /^I should see the destroy product button$/ do
  within('tr[data-name="salad"]') do
    page.should have_selector('a.btn[data-method="delete"][title="Destroy"]')
  end
end

Then /^"(.*?)" should be the item (\d+) of the list of products$/ do |name, position|
  page.should have_selector("tr:nth-child(#{position.to_i})", text: name)
end

Then /^"(.*?)" should be the (\S+) item of the list of products$/ do |name, position_name|

  case position_name
  when "first"
    position = 1
  when "second"
    position = 2
  when "third"
    position = 3
  when "fourth"
    position = 4
  else
    position = nil
    puts "Undefinded: '#{position_name}' is not a known position"
  end

  steps %{
    Then I should see "#{name}"
    And "#{name}" should be the item #{position} of the list of products
  }
end
