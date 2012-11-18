require 'spec_helper'

describe ShoppingList do

  it "should have valid factory" do
    FactoryGirl.build(:shopping_list).should be_valid
  end

  it "should have many products" do
    should have_many(:products)
  end
end
