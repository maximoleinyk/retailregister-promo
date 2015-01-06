var SubscribeForm = (function () {

    return Marionette.ItemView.extend({

        template: RetailRegisterPromo.templates['subscribeForm'],
        tagName: 'form',

        events: {
            submit: 'subscribe'
        },

        subscribe: function (e) {
            e.preventDefault();

            var self = this,
                data = this.$el.serializeObject();

            return $.post('/subscribe', data).done(function () {
                self.trigger('success', data)
            }).fail(function () {
                console.log('Fail')
            })
        }

    });
}());
