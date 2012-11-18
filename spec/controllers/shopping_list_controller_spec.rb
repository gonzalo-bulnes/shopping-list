require 'spec_helper'

describe ShoppingListController do

  describe "GET 'index'" do
    before(:each) do
      # Given there is a shopping list
      @shopping_list = FactoryGirl.create(:shopping_list)
    end

    it "should be valid when there is more than one shopping list" do
      pending "which is not yet the case"
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'add_product'" do
    before(:each) do
      # Given there is a shopping list
      @shopping_list = FactoryGirl.create(:shopping_list)
      # Given there is a product in the list of products
      @product = FactoryGirl.create(:product)
    end

    it "should be valid when there is more than one shopping list" do
      pending "which is not yet the case"
    end

    it "redirects to the referrer" do
      post :add_product, id: @product.id

      response.should redirect_to :back
    end

    context "when the product is in the shopping list" do

      before do
        post :add_product, id: @product.id
      end

      it "does nothing" do
        expect{
          post :add_product, id: @product.id
        }.not_to change(@shopping_list.products, :count)
      end
    end

    context "when the product is not in the shopping list" do

      it "adds the product to the shopping list" do
        expect{
          post :add_product, id: @product.id
        }.to change(@shopping_list.products, :count).by(1)
      end
    end
  end

  describe "POST 'create'" do

    it "creates a new shopping_list" do
      expect{
        post :create, shopping_list: FactoryGirl.attributes_for(:shopping_list)
      }.to change(ShoppingList,:count).by(1)
    end

    it "redirects to the new shopping_list" do
      post :create, shopping_list: FactoryGirl.attributes_for(:shopping_list)
      response.should redirect_to shopping_list_path
    end

    it "does not create a shopping list if one already exists" do
      # Given there is a shopping list in the database
      post :create, shopping_list: FactoryGirl.attributes_for(:shopping_list)

      expect{
        post :create, shopping_list: FactoryGirl.attributes_for(:shopping_list)
      }.not_to change(ShoppingList,:count)
    end
  end

  describe "POST 'remove_product'" do
    before(:each) do
      # Given there is a shopping list
      @shopping_list = FactoryGirl.create(:shopping_list)
      # Given there is a product in the list of products
      @product = FactoryGirl.create(:product)
    end

    it "should be valid when there is more than one shopping list" do
      pending "which is not yet the case"
    end

    it "redirects to the referrer" do
      post :remove_product, id: @product.id

      response.should redirect_to :back
    end

    context "when the product is in the shopping list" do

      before do
        post :add_product, id: @product.id
      end

      it "removes it from the shopping list" do
        expect{
          post :remove_product, id: @product.id
        }.to change(@shopping_list.products, :count).by(-1)
      end
    end

    context "when the product is not in the shopping list" do

      it "does nothing" do
        expect{
          post :remove_product, id: @product.id
        }.not_to change(@shopping_list.products, :count)
      end
    end
  end
end
