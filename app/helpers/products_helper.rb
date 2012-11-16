module ProductsHelper
  class ShoppingList
    def count
      Product.where( is_in_shopping_list: true ).count
    end
  end
end
