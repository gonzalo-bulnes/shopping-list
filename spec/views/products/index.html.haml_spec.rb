require 'spec_helper'

describe "products/index" do

  before(:each) do
    @shopping_list = FactoryGirl.create(:shopping_list)
    @products = []
  end

  it "renders a title" do
    render

    assert_select "h1", text: "Products"
  end

  context "when there are products" do

    it "renders all products" do
      assign(:products, [
        FactoryGirl.build_stubbed(:product, name: "carrots"),
        FactoryGirl.build_stubbed(:product, name: "spinach"),
        FactoryGirl.build_stubbed(:product, name: "apples"),
        FactoryGirl.build_stubbed(:product, name: "salad")
      ].sort_by { |product| product.name.downcase } )

      render

      expect(rendered).to match /carrots/
      expect(rendered).to match /spinach/
      expect(rendered).to match /apples/
      expect(rendered).to match /salad/
    end

    context "and some products are in the shopping list" do

      before(:each) do
        @products = [
          FactoryGirl.create(:product, name: "carrots"),
          FactoryGirl.create(:product, name: "spinach"),
          FactoryGirl.create(:product, name: "apples"),
          FactoryGirl.create(:product, name: "salad")
        ].sort_by { |product| product.name.downcase }

        # add some products to the shopping list
        for id in [0, 1, 3] do
          @shopping_list.products << @products[id]
          @products[id].status!(@products[id], @shopping_list, "pending")
        end
      end

      it "doesn't render products which do not exist" do
        render

        expect(rendered).not_to match /strawberries/
      end
    end
  end
end