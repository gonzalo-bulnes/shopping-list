# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shopping_lists_products_association do
    product
    shopping_list
    status nil
  end
end
