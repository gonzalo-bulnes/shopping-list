class AddStatusToShoppingListsProductsAssociations < ActiveRecord::Migration
  def change
    add_column :shopping_lists_products_associations, :status, :string, default: nil
  end
end
