class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|

      t.timestamps
    end
  end
end
