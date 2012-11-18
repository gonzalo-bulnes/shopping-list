require 'spec_helper'

describe ShoppingList do
  
  it "should have many products" do
    should have_many(:product)
  end
end
