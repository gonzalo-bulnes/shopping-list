App.Router.map(function () {
  this.resource('shopping_list_items', { path: '/' });
});

App.ShoppingListItemsRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('shopping_list_item');
  }
});
