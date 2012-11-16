class ShoppingListController < ApplicationController
  def index
    @items = Product.in_shopping_list
  end
end
