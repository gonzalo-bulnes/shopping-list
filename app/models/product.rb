class Product < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { message: "is already in you products list"}

  scope :in_shopping_list, where( in_shopping_list: true )
end
