FactoryGirl.define do
  factory :product do
    name "salad"
  end

  factory :invalid_product, parent: :product do
    name ""
  end

  factory :product_in_shopping_list, parent: :product do
    in_shopping_list true
  end
end
