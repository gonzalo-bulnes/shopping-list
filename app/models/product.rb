class Product < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { message: "is already in you products list"}
end
