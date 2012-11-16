require 'spec_helper'

describe ProductsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    context "with valid attributes" do
      it "creates a new product" do
        expect{
          post :create, product: FactoryGirl.attributes_for(:product)
        }.to change(Product,:count).by(1)
      end

      it "redirects to the new product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        response.should redirect_to products_path
      end

      it "does not create two products with the same name" do
        # Given there is a product in the database
        post :create, product: FactoryGirl.attributes_for(:product)

        expect{
          post :create, product: FactoryGirl.attributes_for(:product)
        }.not_to change(Product,:count)
      end
    end

    context "with invalid attributes" do
      it "does not save the new product" do
        expect{
          post :create, product: FactoryGirl.attributes_for(:invalid_product)
        }.to_not change(Product,:count)
      end

      it "re-renders the new method" do
        post :create, product: FactoryGirl.attributes_for(:invalid_product)
        response.should render_template :new
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @product = FactoryGirl.create(:product)
    end

    it "deletes the product" do
      expect{
        delete :destroy, id: @product        
      }.to change(Product,:count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, id: @product
      response.should redirect_to products_url
    end
  end

  describe "POST 'add'" do
    before(:each) do
      # Given there is a product in the list of products
      @product = FactoryGirl.create(:product)
    end

    it "redirects to the referrer" do
      post :add, id: @product.id

      response.should redirect_to :back
    end

    it "adds the product to the shopping list" do
      expect{
        post :add, id: @product.id
      }.to change(Product.in_shopping_list, :count).by(1)
    end
  end
end
