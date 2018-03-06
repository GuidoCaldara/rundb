import "bootstrap";
import { autocomplete } from '../components/autocomplete';
import GMaps from 'gmaps/gmaps.js';


autocomplete();

window.addEventListener('load', function() {

const search = instantsearch({
  appId: 'MP37CKD4Q3',
  apiKey: '6a1098bae7556066297966e90caef0d6',
  indexName: 'Race',
  urlSync: true
});

search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-input',
    placeholder: 'Search for races'
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: document.getElementById('hit-template').innerHTML,
      empty: "We didn't find any results for the search <em>\"{{query}}\"</em>"
    }
  })
);

  search.addWidget(
    instantsearch.widgets.refinementList({
      container: '#race_categories',
      attributeName: 'category',
      operator: 'or',
      limit: 10,
      sortBy: ['name:asc']
    })
  );

  const datePicker = instantsearch.connectors.connectRange(
  (options, isFirstRendering) => {
    if (!isFirstRendering) return;

    const { refine } = options;

    new Calendar({
      element: $('#calendar'),
      callback: function() {
        const start = new Date(this.start_date).getTime();
        const end = new Date(this.end_date).getTime();

        refine([start, end]);
      }
      // Some good parameters based on our dataset:
      // start_date: new Date(),
      // end_date: new Date('01/01/2020'),
      // earliest_date: new Date('01/01/2008'),
      // latest_date: new Date('01/01/2020'),
    });
  }
);

  search.addWidget(
  datePicker({
    attributeName: 'date_stamp',
  })
);

search.addWidget(
    instantsearch.widgets.rangeSlider({
      container: '#distance',
      attributeName: 'distance',
      pips: false,
      tooltips: {format: function(rawValue) {return 'km' + parseInt(rawValue)}}
    })
    );

  // search.addWidget(
  //   instantsearch.widgets.googleMaps({
  //     container: document.querySelector('#map'),
  //     prepareMarkerData: function(hit, index, hits) {
  //       return {
  //         title: hit.name
  //       };
  //     }
  //   })
  // );

  var customMapWidget = {
  // _autocompleteContainer: document.querySelector('#places'),
  _mapContainer: document.querySelector('#map'),
  markers: [],

  // Transform one hit to a Google Maps marker
  _hitToMarker: function(hit) {
    var marker = new google.maps.Marker({
      position: {lat: hit._geoloc.lat, lng: hit._geoloc.lng},
      map: this._map,
      title: hit.name
    });

   // if (hit.extra_attr.photo.url) {
   // var photo = hit.extra_attr.photo.url
   // } else {
   //  photo = "http://lorempixel.com/400/200/"
   // };

    var infowindow = new google.maps.InfoWindow({
      content: `
      <div class="info-popup">
          <a href="/races/${hit.id}">
            <div class="card-popup">


              <div class="card-body-popup">
                <p class="title">${hit.name}</p>
                <p class="location"><i class="fas fa-map-marker-alt"></i>${hit.location}</p>
                <p class="popup-rate">Rating: ${hit.race_avg_rate} / 10</p>
                <div class="inlined">
                <p class="element">${hit.category}</p>
                <p class="element">${hit.distance} km</p>
                <p class="element last">${hit.reviews.length} reviews</p>
                </div>
              </div>
            </div>
          </a>
      </div>`
    });

    // PUT THIS BACK WHILE IN PRODUCTION WHERE EVERY RACE HAS A PHOTO
    // <div class="card-header-popup" style="background-image: linear-gradient(rgba(0, 0, 0, 0.23), rgba(0, 0, 0, 0)), url(${hit.extra_attr.photo.url})">
    // </div>


    // Add an info popup when clicking on the marker.
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });

    return marker;
  },

  init: function(params) {
    this._helper = params.helper;

    // Initialize the map
    this._map = new google.maps.Map(
        this._mapContainer,
        {zoom: 1, center: new google.maps.LatLng(0, 0), styles: [
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#e0efef"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#1900ff"
            },
            {
                "color": "#c0e8e8"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 100
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": 700
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#7dcdcd"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#30a6cc"
            }
        ]
    }
]
}
    );
  },

  render: function(params) {
    // Clear markers
    this.markers.forEach(function (marker) {
      marker.setMap(null)
    });

    // Transform hits to Google Maps markers
    this.markers = params.results.hits.map(this._hitToMarker.bind(this));

    var bounds = new google.maps.LatLngBounds();

    // Make sure we display the good part of the maps
    this.markers.forEach(function(marker) {
      bounds.extend(marker.getPosition());
    });

    this._map.fitBounds(bounds);
  }
};

search.addWidget(customMapWidget);

search.start();
});


