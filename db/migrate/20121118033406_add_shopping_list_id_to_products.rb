class AddShoppingListIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shopping_list_id, :integer, default: nil
  end
end
