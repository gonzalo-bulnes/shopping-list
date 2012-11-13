require 'spec_helper'

describe "Products Pages:" do
  describe "product list page" do

    it "should have a title" do
      visit products_path

      page.should have_selector("h1", text: "Products")
    end

    context "when there are products" do
      let!(:carrots) { FactoryGirl.create(:product, name: "carrots") }
      let!(:spinach) { FactoryGirl.create(:product, name: "spinach") }
      let!(:apples)  { FactoryGirl.create(:product, name: "apples")  }
      let!(:salad)   { FactoryGirl.create(:product, name: "salad")   }

      before { visit products_path }

      it "should mention them all" do
        page.should have_content "carrots"
        page.should have_content "spinach"
        page.should have_content "apples"
        page.should have_content "salad"
      end

      it "should list them all in a bootstrap table" do
        page.should have_css('table.table tbody tr td', text: "carrots")
        page.should have_css('table.table tbody tr td', text: "spinach")
        page.should have_css('table.table tbody tr td', text: "apples")
        page.should have_css('table.table tbody tr td', text: "salad")
      end
    end
  end
end