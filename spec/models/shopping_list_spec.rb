require 'spec_helper'

describe ShoppingList do

  it "should have valid factory" do
    FactoryGirl.build(:shopping_list).should be_valid
  end

  it "should have many products through an association" do
    should have_many(:shopping_lists_products_associations)
    should have_many(:products).through(:shopping_lists_products_associations)
  end
end
