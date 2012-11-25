class ShoppingListController < ApplicationController

  def add_product
    @product = Product.find(params[:id])

    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first

    if !@product.nil? and !@shopping_list.products.include?(@product)
      # create the association
      @shopping_list.products << @product
      # set the default status
      @product.status!(@product, @shopping_list, "pending")
    end

    respond_to do |format|
      format.html do
        request.env['HTTP_REFERER'] ||= products_url
        redirect_to :back
      end
      format.js
    end
  end

  def create
    # Only one shopping list should be created.
    ShoppingList.create unless ShoppingList.count != 0

    respond_to do |format|
      format.html { redirect_to shopping_list_path }
    end
  end

  def index
    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first

    @items = @shopping_list.products
  end

  def remove_product
    @product = Product.find(params[:id])

    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first

    @shopping_list.products.delete(@product) unless @product.nil?

    respond_to do |format|
      format.html do
        request.env['HTTP_REFERER'] ||= products_url
        redirect_to :back
      end
      format.js
    end
  end

  def toggle_status_product
    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first

    @product = @shopping_list.products.where(id: params[:id]).first

    if @product.status(@product, @shopping_list) == "pending"
      @product.status!(@product, @shopping_list, "done")
    else # status is "done"
      @product.status!(@product, @shopping_list, "pending")
    end

    respond_to do |format|
      format.html do
        request.env['HTTP_REFERER'] ||= shopping_list_url
        redirect_to :back
      end
      format.js
    end
  end
end
