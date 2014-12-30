(function (root, factory) {
    if (typeof exports === 'object') {
        module.exports = factory();
    } else if (typeof define === 'function' && define.amd) {
        define(factory);
    } else {
        factory();
    }
}(this, function () {

    // @include ./libs/underscore/underscore.js
    // @include ./libs/jquery/dist/jquery.js
    // @include ./libs/backbone/backbone.js
    // @include ./libs/backbone-nested/backbone-nested.js
    // @include ./libs/bootstrap/dist/js/bootstrap.js
    // @include ./libs/handlebars/handlebars.js
    // @include ./libs/backbone.babysitter/lib/backbone.babysitter.js
    // @include ./libs/backbone.wreqr/lib/backbone.wreqr.js
    // @include ./libs/marionette/lib/backbone.marionette.js

    // @include ./app/start.js

}));
