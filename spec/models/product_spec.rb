require 'spec_helper'

describe Product do
  it "should have a name" do
    should respond_to :name
  end
end
