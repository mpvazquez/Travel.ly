function initialize() {
  var autocomplete = new google.maps.places.Autocomplete(
    (document.getElementById('autocomplete')),
    { types: ['geocode'] }
  );
// When the user selects an address from the dropdown,
// populate the address fields in the form.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    extractPlaceData(autocomplete);
  });
}

// [START region_fillform]
function extractPlaceData(autocomplete) {
  var object = autocomplete.getPlace();
  var placeData = {};

  if (["neighborhood", "locality", "sublocality"].indexOf(object.types[0]) === -1) {
    alert("Please choose a city.");
    return;
  }

  placeData["city"] = object.address_components[0].long_name;
  placeData["state"] = object.address_components[object.address_components.length - 2].long_name;
  placeData["country"] = object.address_components[object.address_components.length - 1].long_name;
  placeData["google_id"] = object.id;
  placeData["latitude"] = object.geometry.location.k;
  placeData["longitude"] = object.geometry.location.A;
  console.log(placeData);
}

window.onload = function() {
  initialize();
}