App.ShoppingListItemController = Ember.ObjectController.extend({
  isDone: function(key, value){
    var model = this.get('model');

    if (value === undefined) {
      // property being used as a getter
      return model.get('isDone');
    } else {
      // property being used as a setter
      model.set('isDone', value);
      model.save();
      return value;
    }
  }.property('model.isDone')
});
