class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :shopping_lists_products_associations
  has_many :shopping_lists, through: :shopping_lists_products_associations

  validates :name, presence: true, uniqueness: { message: "is already in you products list"}

  def in_shopping_list?
    # Valid while there is only one shopping list
    @shopping_list = ShoppingList.all.first
    
    @shopping_list.products.include?(self)
  end

  def status product, shopping_list
    if product.shopping_lists_products_associations
           .where(shopping_list_id: shopping_list.id)
           .first.nil?
           nil
    else
      product.shopping_lists_products_associations
           .where(shopping_list_id: shopping_list.id)
           .first.status
    end
  end

  def status! product, shopping_list, status
    product.shopping_lists_products_associations
           .where(shopping_list_id: shopping_list.id)
           .first.update_attribute(:status, status)
  end
end
