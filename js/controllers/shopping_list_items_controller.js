App.ShoppingListItemsController = Ember.ArrayController.extend({
  actions: {
    createShoppingListItem: function () {
      // Get the shoppingListItem name set by the "New ShoppingListItem" text field
      var name = this.get('newName');
      if (!name.trim()) { return; }

      // Create the new ShoppingListItem model
      var shoppingListItem = this.store.createRecord('shopping_list_item', {
        name: name,
        isDone: true
      });

      // Clear the "New ShoppingListItem" text field
      this.set('newName', '');

      // Save the new model
      shoppingListItem.save();
    }
  }
});
