


function generateMap(){
  btn = document.getElementById("bottone")

btn.addEventListener("click", function() {
  let array = []
  link = document.getElementById("link").value
  arr = link.split("/")
  route_id = arr[4];
  console.log(route_id)
  fetch(`https://www.strava.com/api/v3/activities/${route_id}/streams/latlng?access_token=66868bd1b99a6143fb4bb28cd50993175b5028cd`)
   .then(response => response.json())
  .then((data) => {
    let cord = (data[0].data);
    cord.forEach(function (element){
      array.push(element)
    })
    generate_route(array)
  });

})


}


function generate_route(array){

 var map = L.map('map',{
    center: [43.64701, -79.39425],
    zoom: 15
    });

var latlngs = array
var polyline = L.polyline(latlngs, {color: 'red'}).addTo(map);
map.fitBounds(polyline.getBounds());

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
}


export { generateMap };
