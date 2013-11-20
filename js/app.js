App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_VIEW_LOOKUPS: true,
  LOG_ACTIVE_GENERATION: true
});

// App.ApplicationAdapter = DS.FixtureAdapter.extend();
App.ApplicationAdapter = DS.RESTAdapter.extend({
  host: 'http://localhost:3000'
});

// For now, only one shopping list is available.
App.ShoppingListAdapter = DS.FixtureAdapter.extend();

App.Router.map(function() {
  this.resource('products', function() {
    this.route('product', { path: ':product_id' })
  });
  this.resource('shopping_lists', function() {
    this.route('shopping_list', { path: ':shopping_list_id' })
  });
});

App.ProductsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('product');
  }
});

App.Product = DS.Model.extend({
  name: DS.attr('string')
});

App.Product.FIXTURES = [
  {
    "id": 1,
    "name": "betarraga",
    "created_at": "2013-11-03T15:47:15.517Z",
    "updated_at": "2013-11-19T12:15:51.888Z"
  },
  {
    "id": 2,
    "name": "zanahorias",
    "created_at": "2013-11-19T14:42:45.627Z",
    "updated_at": "2013-11-19T14:42:45.627Z"
  }
]

App.ShoppingList = DS.Model.extend({
  name: DS.attr('string')
});

App.ShoppingList.FIXTURES = [
  {
    "id": 1,
    "name": "Daily"
  }
]

App.ShoppingListRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('shopping_list');
  }
  // ,
  // afterModel: function(posts, transition) {
  //   Ember.Logger.error('log value of foo:', foo);
  //   if (posts.length === 1) {
  //     this.transitionTo('shopping_lists', posts[0]);
  //   }
  // }
});

// App.ShoppingListsRoute = Ember.Route.extend({
//   // redirect: function() {
//   //   this.transitionTo('products');
//   // }
//   // var lala = 'lalala';
//   // var shopping_list = this.store.find('shopping_lists').get('firstObject');
//   // this.transitionTo('shopping_list', shopping_list);
// });

App.ShoppingListsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('shopping_list');
  }
});
