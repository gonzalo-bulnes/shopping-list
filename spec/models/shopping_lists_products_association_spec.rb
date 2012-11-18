require 'spec_helper'

describe ShoppingListsProductsAssociation do

  it "should belong to shopping lists" do
    should belong_to(:shopping_list)
  end

  it "should belong to products" do
    should belong_to(:product)
  end

  it "should have a valid factory" do
    FactoryGirl.build(:shopping_lists_products_association).should be_valid
  end
end
