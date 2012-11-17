Then /^the "Remove from the shopping list" button should have a star icon$/ do
  within 'tr[data-name="salad"]' do
    page.should have_selector('a[title="Remove from the shopping list"][data-method="post"] i.icon-star')
  end
end

Then /^the "Add to the shopping list" button should have an empty star icon$/ do
  within 'tr[data-name="salad"]' do
    page.should have_selector('a[title="Add to the shopping list"][data-method="post"]  i.icon-star-empty')
  end
end
