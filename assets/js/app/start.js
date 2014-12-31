(function () {
    'use strict';

    $(document).ready(function () {

        var View = Marionette.ItemView.extend({
            template: RetailRegisterPromo.templates['main'],
            el: $('[data-id="app"]')
        });

        new View().render();

    });

})();
