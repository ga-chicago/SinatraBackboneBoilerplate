var insta = insta || {};
insta.active = insta.active || {};
insta.blueprints = insta.blueprints || {};

insta.blueprints.model = Backbone.Model.extend({
  //url: '/api/instafake',
  initialize: function() {
    console.log('Model has been instntiated.');
    this.fetch();
  }
});

insta.blueprints.collection = Backbone.Collection.extend({
  model: insta.blueprints.model,
  url: '/api/instafake',
  initialize: function() {
    console.log('Collection has been instantiated.');
    this.on('change', function() {
      this.fetch();
    });
  }
});

insta.blueprints.modelView = Backbone.View.extend({
  initialize: function() {
    console.log('modelView has been instantiated.');
  },
  render: function() {

  }
});

insta.blueprints.collectionView = Backbone.View.extend({
  events: {
    'click': 'logIt'
  },
  initialize: function() {
    console.log('collectionView has been instantiated.');
    this.render();
  },
  render: function() {
    this.$el.html('yolo');
  },
  logIt: function() {
    console.log('the collectionView has been clicked!');
  }
});

$(document).ready(function() {
  insta.active.photosCollection = new insta.blueprints.collection();
  insta.active.photosCollection.fetch();
  insta.active.photosCollectionView = new insta.blueprints.collectionView({
    el: $('#table-container'),
    collection: insta.active.photosCollection
  });
});

//insta.active.photosCollection.create({ username: 'bruce wayne', post: 'dead_parents.gif', description: ' :( ', hashtags: 'YOLO' });
