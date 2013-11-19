App.ShoppingListItem = DS.Model.extend({
  name: DS.attr('string'),
  isDone: DS.attr('boolean')
});

App.ShoppingListItem.FIXTURES = [
  {
    id: 1,
    name: 'Carrots',
    isDone: true
  },
  {
    id: 2,
    name: 'Salad',
    isDone: true
  },
  {
    id: 3,
    name: 'Cucumbers',
    isDone: false
  }
];
