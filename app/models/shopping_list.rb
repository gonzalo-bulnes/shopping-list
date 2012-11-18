class ShoppingList < ActiveRecord::Base
  has_many :shopping_lists_products_associations
  has_many :products, through: :shopping_lists_products_associations
end
