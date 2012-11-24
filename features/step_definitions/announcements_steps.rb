Given /^there is an announcement$/ do
  @announcement = FactoryGirl.create(:announcement)
end

Given /^there is an announcement scheduled in the future$/ do
  @announcement = FactoryGirl.create(:announcement, starts_at: 10.minutes.from_now)
end

Given /^there is an outdated announcement$/ do
  @announcement = FactoryGirl.create(:announcement, ends_at: 10.minutes.ago)
end

When /^I dismiss the announcement$/ do
  within("div[data-id=\"#{@announcement.id}\"]") do
    click_link "Dismiss"
  end
end

Then /^I should( not)? see the announcement$/ do |negate|
  if negate
    page.should_not have_content(@announcement.message)
  else
    page.should have_content(@announcement.message)
  end
end

Then /^I should not see the announcement on the list of products page$/ do
  steps %{
    When I go to the list of products page
    Then I should not see the announcement
  }
end
