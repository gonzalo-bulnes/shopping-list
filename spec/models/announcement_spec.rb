require 'spec_helper'

describe Announcement, focus: true do
  it "should have a message" do
    should respond_to :message
  end

  it "should have a start time" do
    should respond_to :starts_at
  end

  it "should have an end time" do
    should respond_to :ends_at
  end

  it "should have valid factory" do
    FactoryGirl.build(:announcement).should be_valid
  end

  it "should require a non-blank message" do
    FactoryGirl.build(:announcement, message: "").should_not be_valid
  end

  it "should require a start time" do
    FactoryGirl.build(:announcement, starts_at: nil).should_not be_valid
  end

  it "should require an end time" do
    FactoryGirl.build(:announcement, ends_at: nil).should_not be_valid
  end
end
