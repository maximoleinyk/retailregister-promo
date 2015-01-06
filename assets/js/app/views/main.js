var MainView = (function() {

    // @include ./subscribeForm.js
    // @include ./congratulations.js

    return Marionette.LayoutView.extend({

        template: RetailRegisterPromo.templates['main'],
        el: $('[data-id="content"]'),

        regions: {
            form: '#form'
        },

        initialize: function() {
            this.listenTo(this, 'success', this.renderCongratulations, this);
        },

        onRender: function() {
            this.renderForm();
        },

        renderForm: function() {
            this.form.show(new SubscribeForm({
                parent: this
            }));
        },

        renderCongratulations: function(data) {
            this.form.show(new Congratulations(data));
        }

    });
}());
