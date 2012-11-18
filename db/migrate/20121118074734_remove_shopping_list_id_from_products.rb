class RemoveShoppingListIdFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :shopping_list_id
  end

  def down
    add_column :products, :shopping_list_id, :integer, default: nil
  end
end
