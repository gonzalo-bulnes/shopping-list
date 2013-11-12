App.ShoppingListItem = DS.Model.extend({
  name: DS.attr('string'),
  isPending: DS.attr('boolean')
});

App.ShoppingListItem.FIXTURES = [
  {
    id: 1,
    name: 'Carrots',
    isPending: true
  },
  {
    id: 2,
    name: 'Salad',
    isPending: true
  },
  {
    id: 3,
    name: 'Cucumbers',
    isPending: false
  }
];
