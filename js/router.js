ShoppingList.Router.map(function () {
  this.resource('shoppingList', { path: '/' });
});

ShoppingList.ShoppingListRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('shoppingListItem');
  }
});
