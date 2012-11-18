class AddForeignKeysToShoppingListsProductsAssociations < ActiveRecord::Migration
  def change
    add_column :shopping_lists_products_associations, :shopping_list_id, :integer, default: nil
    add_column :shopping_lists_products_associations, :product_id, :integer, default: nil
  end
end
