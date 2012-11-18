class Product < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { message: "is already in you products list"}

  scope :in_shopping_list, where( in_shopping_list: true )

  def in_shopping_list?
    # Valid while there is only one shopping list
    shopping_list_id == ShoppingList.all.first.id
  end
end
