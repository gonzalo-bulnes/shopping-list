class ShoppingList < ActiveRecord::Base
  has_many :products
end
