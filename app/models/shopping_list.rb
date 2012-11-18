class ShoppingList < ActiveRecord::Base
  has_many :product
end
