Then(/^I see a landing page$/) do
  expect(page).to have_content('Shopping List')
end

