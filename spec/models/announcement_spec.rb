require 'spec_helper'

describe Announcement do
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

  describe "'current' scope" do
    it "should contain only active announcements" do
      passed = FactoryGirl.create(:announcement, ends_at: 10.minutes.ago)
      current = FactoryGirl.create(:announcement)
      upcoming = FactoryGirl.create(:announcement, starts_at: 10.minutes.from_now)

      Announcement.current.should eq [current]
    end
  end

  describe "'current' method" do


    it "should return 'current' scope when no hidden announcements are passed in" do
      current = FactoryGirl.create(:announcement)
      Announcement.current(nil).should eq([current])
    end

    it "should return 'current' scope without the hidden announcements passed in" do
      current1 = FactoryGirl.create(:announcement)
      current2 = FactoryGirl.create(:announcement)
      Announcement.current([current2.id]).should eq([current1])
    end
  end
end
