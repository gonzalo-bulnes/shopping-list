require 'spec_helper'

describe "Announcements" do

  context "when hidden with javascript" do
    before(:each) do
      # Given there is an announcement
      @announcement = FactoryGirl.create(:announcement)
      # Given there is a shopping list
      @shopping_list = FactoryGirl.create(:shopping_list)

      visit shopping_list_path
    end

    it "should not reload the page" do

      pending "because the test fails with if ran with the `js: true` tag"

      # this ca be removed once the test is passing with `js: true`
      page.should have_content(@announcement.message)

      expect do
        within("div[data-id=\"#{@announcement.id}\"]") do
          click_link "Dismiss"
        end
      end.to_not change { page.response_headers }

      # this ca be removed once the test is passing with `js: true`
      page.should_not have_content(@announcement.message)
    end
  end
end