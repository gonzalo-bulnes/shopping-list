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
end
