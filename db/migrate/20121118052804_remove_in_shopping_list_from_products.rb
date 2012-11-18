class RemoveInShoppingListFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :in_shopping_list
  end

  def down
    add_column :products, :in_shopping_list, :boolean, default: false
  end
end
