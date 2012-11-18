class ShoppingListsProductsAssociation < ActiveRecord::Base
  attr_accessible :status

  belongs_to :product
  belongs_to :shopping_list
end
