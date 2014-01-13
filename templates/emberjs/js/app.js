App = Ember.Application.create({});

var posts = [{
  id: '1',
  title: "Cocky is the bomb",
  author: { name: "Cocky" },
  excerpt: "Cocky Generates EmberJS bloggers!.",
  body: "Candy tiramisu fruitcake cotton candy chupa chups gingerbread. Tootsie roll sweet roll liquorice unerdwear.com sweet roll cake muffin. Chocolate bar tart croissant cupcake pudding tart chocolate cake lemon drops. Powder jelly beans donut jelly liquorice gummies dessert unerdwear.com marshmallow. "
}, {
  id: '2',
  title: "Cocky The Best",
  author: { name: "Cocky" },
  excerpt: "Cocky Best IDE ever!",
  body: "Gummies sweet powder chocolate cake halvah. Tiramisu cake sweet sugar plum caramels topping pudding bear claw liquorice. Croissant sugar plum pudding. Ice cream macaroon pie. Cake caramels macaroon jelly beans. Cheesecake chocolate bar jujubes halvah biscuit pudding cake gingerbread chupa chups. Tiramisu halvah bonbon oat cake applicake pastry chupa chups candy canes. Pudding bear claw cake donut apple pie liquorice wafer sweet topping."  
}];

App.Router.map(function() {
  this.resource('about');
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' });
  });
});

App.PostsRoute = Ember.Route.extend({
  model: function() {
    return posts;
  }
});

App.PostRoute = Ember.Route.extend({
  model: function(params) {
    return posts.findBy('id', params.post_id);
  }
});

App.PostController = Ember.ObjectController.extend({
  isEditing: false,

  edit: function() {
    this.set('isEditing', true);
  },

  doneEditing: function() {
    this.set('isEditing', false);
    this.get('store').commit();
  }
});

var showdown = new Showdown.converter();

Ember.Handlebars.helper('format-markdown', function(input) {
  return new Handlebars.SafeString(showdown.makeHtml(input));
});

Ember.Handlebars.helper('format-date', function(date) {
  return moment(date).fromNow();
});
