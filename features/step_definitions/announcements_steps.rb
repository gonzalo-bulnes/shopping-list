Given /^there is an annoucement$/ do
  @announcement = FactoryGirl.create(:announcement)
end

Then /^I should( not)? see the annoucement$/ do |negate|
  if negate
    page.should_not have_content(@announcement.message)
  else
    page.should have_content(@announcement.message)
  end
end

Given /^there is an annoucement scheduled in the future$/ do
  @announcement = FactoryGirl.create(:announcement, starts_at: 10.minutes.from_now)
end

Given /^there is an outadted annoucement$/ do
  @announcement = FactoryGirl.create(:announcement, ends_at: 10.minutes.ago)
end
