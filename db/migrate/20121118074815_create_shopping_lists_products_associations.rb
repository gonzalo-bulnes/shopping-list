class CreateShoppingListsProductsAssociations < ActiveRecord::Migration
  def change
    create_table :shopping_lists_products_associations do |t|

      t.timestamps
    end
  end
end
