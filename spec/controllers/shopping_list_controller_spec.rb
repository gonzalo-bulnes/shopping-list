require 'spec_helper'

describe ShoppingListController do

  describe "POST 'add'" do
    
    context "with valid attributes" do

      it "redirects to the referrer" do
        post :add, product: FactoryGirl.attributes_for(:product)

        response.should redirect_to :back
      end

      it "adds the product to the shopping list" do
        expect {
          post :add, product: FactoryGirl.attributes_for(:product)
        }.to change(ShoppingList, :count).by(1)
      end
    end

    context "with invalid attributes" do
      
      it "does not add the product to the shopping list" do
        expect {
          post :add, invalid_product: FactoryGirl.attributes_for(:invalid_product)
        }.not_to change(ShoppingList, :count)
      end

      it "redirects to the referrer" do
        post :add, invalid_product: FactoryGirl.attributes_for(:invalid_product)

        response.should redirect_to :back
      end
    end
  end
end
