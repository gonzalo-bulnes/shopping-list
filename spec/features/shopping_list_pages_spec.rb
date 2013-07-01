require 'spec_helper'
# http://www.andylindeman.com/2012/11/11/rspec-rails-and-capybara-2.0-what-you-need-to-know.html

describe "Shopping List Pages:" do
  describe "shopping list page" do

    let!(:shopping_list) { FactoryGirl.create(:shopping_list) }

    before { visit products_path }

    it "should have a title" do
      visit shopping_list_path

      page.should have_selector("h1", text: "Shopping List")
    end

    context "when there are products" do
      let!(:carrots) { FactoryGirl.create(:product, name: "carrots") }
      let!(:spinach) { FactoryGirl.create(:product, name: "spinach") }
      let!(:apples)  { FactoryGirl.create(:product, name: "apples")  }
      let!(:salad)   { FactoryGirl.create(:product, name: "salad")   }


      context "and no products are in the shopping list" do

        it "shouldn't mention any product" do
          page.should_not have_content "carrots"
          page.should_not have_content "spinach"
          page.should_not have_content "apples"
          page.should_not have_content "salad"
        end
      end

      context "and some products are in the shopping list" do

        before(:each) do
          # add some products to the shopping list
          post add_product_path( carrots )
          post add_product_path( apples )
          post add_product_path( salad )
          # then go back to the shopping list page
          visit shopping_list_path
        end

        it "should mention all the products in the shopping list" do
          page.should have_content "carrots"
          page.should have_content "apples"
          page.should have_content "salad"
        end

        it "should list all the displayed products in a bootstrap table" do
          page.should have_css('table.table tbody tr td', text: "carrots")
          page.should have_css('table.table tbody tr td', text: "apples")
          page.should have_css('table.table tbody tr td', text: "salad")
        end

        it "should provide a 'Toggle status' button for each of the displayed products" do
          page.should have_css('tr[data-name="carrots"] a[data-action="toggle-shopping-list-item-status"]')
          page.should have_css('tr[data-name="apples"] a[data-action="toggle-shopping-list-item-status"]')
          page.should have_css('tr[data-name="salad"] a[data-action="toggle-shopping-list-item-status"]')
        end

        it "should use bootstrap for 'Toggle status' buttons" do
          page.should have_css('tr[data-name="carrots"] a[data-action="toggle-shopping-list-item-status"]')
          page.should have_css('tr[data-name="apples"] a[data-action="toggle-shopping-list-item-status"]')
          page.should have_css('tr[data-name="salad"] a[data-action="toggle-shopping-list-item-status"]')
        end

        it "should not mention the products which are not in the shopping list" do
          page.should_not have_content "spinach"
        end
      end
    end
  end
end