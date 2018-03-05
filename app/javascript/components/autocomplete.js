function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var raceLocation = document.getElementById('race_location');

    if (raceLocation) {
      var autocomplete = new google.maps.places.Autocomplete(raceLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(raceLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
