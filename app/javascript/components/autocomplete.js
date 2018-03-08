function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var location = document.getElementById('location');

    if (location) {
      var autocomplete = new google.maps.places.Autocomplete(location, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(location, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
