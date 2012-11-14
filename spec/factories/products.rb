FactoryGirl.define do
  factory :product do
    name "salad"
  end

  factory :invalid_product, parent: :product do
    name ""
  end
end
