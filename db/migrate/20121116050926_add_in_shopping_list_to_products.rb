class AddInShoppingListToProducts < ActiveRecord::Migration
  def change
    add_column :products, :in_shopping_list, :boolean, default: false
  end
end
