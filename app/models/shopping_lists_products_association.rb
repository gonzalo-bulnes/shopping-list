class ShoppingListsProductsAssociation < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_list
end
