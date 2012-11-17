class ShoppingListController < ApplicationController

  def add_product
    @product = Product.find(params[:id])

    @product.update_attribute(:in_shopping_list, true) unless @product.nil?

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end

  def index
    @items = Product.in_shopping_list
  end

  def remove_product
    @product = Product.find(params[:id])

    @product.update_attribute(:in_shopping_list, false) unless @product.nil?

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end
end
