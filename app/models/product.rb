class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :shopping_lists_products_associations
  has_many :shopping_lists, through: :shopping_lists_products_associations

  validates :name, presence: true, uniqueness: { message: "is already in you products list"}

  scope :in_shopping_list, where( in_shopping_list: true )

  def in_shopping_list?
    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first
    
    @shopping_list.products.include?(self)
  end
end
