class ShoppingListController < ApplicationController
  def add
    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end
end
