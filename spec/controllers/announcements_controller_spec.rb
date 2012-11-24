require 'spec_helper'

describe AnnouncementsController do

  before(:each) do
    # Given there is an announcement
    @announcement = FactoryGirl.create(:announcement)
  end
  
  describe "GET 'hide'" do

    it "redirects to the referrer" do
      get :hide, id: @announcement

      response.should redirect_to :back
    end
  end
end
