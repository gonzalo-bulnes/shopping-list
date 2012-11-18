class ShoppingListController < ApplicationController

  def add_product
    @product = Product.find(params[:id])

    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first

    @shopping_list.products << @product unless @product.nil? || @shopping_list.products.include?(@product)

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
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

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end
end
