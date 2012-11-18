require 'spec_helper'

describe ShoppingListsProductsAssociation do

  it "should belong to shopping lists" do
    should belong_to(:shopping_list)
  end

  it "should belong to products" do
    should belong_to(:product)
  end
end
