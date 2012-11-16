require 'spec_helper'

describe Product do
  it "should have a name" do
    should respond_to :name
  end

  it "should have valid factory" do
    FactoryGirl.build(:product).should be_valid
  end

  it "should require a non-blank name" do
    FactoryGirl.build(:product, name: "").should_not be_valid
  end

  describe "is_in_shopping_list? method" do

    context "when the product is in the shopping list" do
      before do
        @product = FactoryGirl.create(:product_in_shopping_list)
      end

      it "should return 'true'" do
        @product.in_shopping_list?.should be_true
      end
    end

    context "when the product is not in the shopping list" do
      before do
        @product = FactoryGirl.create(:product)
      end

      it "should return 'false" do
        @product.in_shopping_list?.should be_false
      end
    end
  end
end
