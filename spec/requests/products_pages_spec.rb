require 'spec_helper'

describe "Products Pages:" do
  describe "product list page" do
    before { visit products_path }

    it "should have a title" do
      page.should have_selector("h1", text: "Products")
    end
  end
end