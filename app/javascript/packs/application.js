import "bootstrap";
import { autocomplete } from '../components/autocomplete';

autocomplete();

window.addEventListener('load', function() {

const search = instantsearch({
  appId: 'MP37CKD4Q3',
  apiKey: '136ef84efd2cef33f59cda19d45384db',
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

  search.addWidget(
    instantsearch.widgets.googleMaps({
      container: document.querySelector('#map'),
      prepareMarkerData: function(hit, index, hits) {
        return {
          title: hit.name
        };
      }
    })
  );


search.start();
});

// jQuery(function() {
//   var completer;

//   completer = new GmapsCompleter({
//     inputField: '#gmaps-input-address',
//     errorField: '#gmaps-error'
//   });

//   completer.autoCompleteInit({
//     country: "us"
//   });
// });
