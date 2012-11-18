class ShoppingListController < ApplicationController

  def add_product
    @product = Product.find(params[:id])

    # Valid while there is only one shopping list
    @product.update_attribute(:shopping_list_id, ShoppingList.all.first.id) unless @product.nil?

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
    @items = ShoppingList.all.first.products
  end

  def remove_product
    @product = Product.find(params[:id])

    @product.update_attribute(:shopping_list_id, nil) unless @product.nil?

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end
end
