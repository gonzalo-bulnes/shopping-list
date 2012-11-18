require 'spec_helper'

describe Product do
  it "should have a name" do
    should respond_to :name
  end

  it "should have valid factory" do
    FactoryGirl.build(:product).should be_valid
  end

  it "should have many shopping lists through an association" do
    should have_many(:shopping_lists_products_associations)
    should have_many(:shopping_lists).through(:shopping_lists_products_associations)
  end

  it "should require a non-blank name" do
    FactoryGirl.build(:product, name: "").should_not be_valid
  end

  describe "is_in_shopping_list? method" do

    it "should be valid when there is more than one shopping list" do
      pending "which is not yet the case"
    end

    context "when the product is in the shopping list" do
      before do
        @shopping_list = FactoryGirl.create(:shopping_list)
        @product = FactoryGirl.create(:product)
        # add the product to the shopping list
        @shopping_list.products << @product
      end

      it "should return 'true'" do
        @product.in_shopping_list?.should be_true
      end
    end

    context "when the product is not in the shopping list" do
      before do
        @shopping_list = FactoryGirl.create(:shopping_list)
        @product = FactoryGirl.create(:product)
      end

      it "should return 'false'" do
        @product.in_shopping_list?.should be_false
      end
    end
  end
end
