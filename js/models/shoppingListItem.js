ShoppingList.ShoppingListItem = DS.Model.extend({
  name: DS.attr('string'),
  isDone: DS.attr('boolean')
});

ShoppingList.ShoppingListItem.FIXTURES = [
 {
   id: 1,
   name: 'Carrots',
   isDone: false
 },
 {
   id: 2,
   name: 'Salad',
   isDone: true
 },
 {
   id: 3,
   name: 'Cucumbers',
   isDone: true
 }
];
