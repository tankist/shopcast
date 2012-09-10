(function (window, document, $) {
    $(function () {
        var $container = $('.login-form');
        function onResize() {
            $container.css('margin-top', -$container.height() / 2);
        }
        $(window).on('resize', onResize);
        onResize();
    });
})(window, document, window.jQuery);