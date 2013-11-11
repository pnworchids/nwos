(function($) {
    $(document).ready(function() {

        function initialize() {
            var LatLong = new google.maps.LatLng(47.657987, -122.290565);
            var mapCanvas = document.getElementById('map_canvas');
            var mapOptions = {
                center: LatLong,
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }

            var map = new google.maps.Map(mapCanvas, mapOptions);

            var marker = new google.maps.Marker({
                position: LatLong,
                map: map,
                title: "University of Washington Botanic Gardens, Center for Urban Horticulture"
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    });
})( jQuery );