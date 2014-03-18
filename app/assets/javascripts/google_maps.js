var getWayPointsResponse;

function getWayPoints(){
  $.getJSON("/trips/" + tripId + "/stops", function(results){
    getWayPointsResponse = $.map(results, function(i, result){
      var latitude = result.latitude;
      var longitude = result.longitude;
      var location = {lat: latitude, lng: longitude};
      return location;
    });
  });
}

