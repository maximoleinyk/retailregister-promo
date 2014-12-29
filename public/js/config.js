require.config({

 baseUrl: '/static/js',

 paths: {
  jquery: 'libs/jquery/dist/jquery',
  underscore: 'libs/underscore/underscore',
  backbone: 'libs/backbone/backbone',
  'backbone-nested': 'libs/backbone-nested-model/backbone-nested',
  'backbone.wreqr': 'libs/backbone.wreqr/lib/amd/backbone.wreqr',
  'backbone.babysitter': 'libs/backbone.babysitter/lib/backbone.babysitter',
  marionette: 'libs/marionette/lib/core/amd/backbone.marionette',
  handlebars: 'libs/handlebars/handlebars',
  bootstrap: 'libs/bootstrap/dist/js/bootstrap'
 },

 shim: {
  jquery: {
   exports: '$'
  },
  underscore: {
   exports: '_'
  },
  backbone: {
   deps: ['underscore', 'jquery'],
   exports: 'Backbone'
  },
  'backbone-nested': {
   deps: ['backbone']
  },
  'backbone.wreqr': {
   deps: ['backbone']
  },
  'backbone.babysitter': {
   deps: ['backbone']
  },
  marionette: {
   deps: ['backbone', 'backbone.wreqr', 'backbone.babysitter']
  }
 },

 deps: [
  'app/common/helpers',
  'bootstrap'
 ]

});

window.RetailRegister || (window.RetailRegister = {});
