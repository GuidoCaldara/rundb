import "bootstrap";

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


/* global instantsearch */

// window.addEventListener('load', function() {
//   let search = instantsearch({
//     appId: 'MP37CKD4Q3',
//     apiKey: '136ef84efd2cef33f59cda19d45384db',
//     indexName: 'Race',
//     urlSync: true
//   });

//   search.addWidget(
//     instantsearch.widgets.searchBox({
//       container: '#search-input',
//       placeholder: 'Find your next race',
//       magnifier: false
//     })
//   );

//   // search.addWidget(
//   //   instantsearch.widgets.stats({
//   //     container: '#stats'
//   //   })
//   // );

//   let hitTemplate =
//     '<div class="hit col-sm-3">'
//     '<div class="pictures-wrapper">'
//       // '<img class="picture" src="{{picture_url}}" />' +
//       // '<img class="profile" src="{{user.user.thumbnail_url}}" />' +
//     '</div>' +
//     '<div class="infos">'
//     '<h4 class="media-heading">{{{_highlightResult.name.value}}}</h4>'
//     '<p>{{{_highlightResult.distance.value}}}, {{{_highlightResult.location.value}}}</p>' +
//     '</div>' +
//     '</div>';

//   let noResultsTemplate = '<div class="text-center">No results found matching <strong>{{query}}</strong>.</div>';

//   search.addWidget(
//     instantsearch.widgets.hits({
//       container: '#hits',
//       hitsPerPage: 12,
//       templates: {
//         empty: noResultsTemplate,
//         item: hitTemplate
//       }
//     })
//   );

//   search.addWidget(
//     instantsearch.widgets.pagination({
//       container: '#pagination',
//       scrollTo: '#results',
//       cssClasses: {
//         root: 'pagination',
//         active: 'active'
//       }
//     })
//   );

//   search.addWidget(
//     instantsearch.widgets.refinementList({
//       container: '#types',
//       attributeName: 'type',
//       operator: 'or',
//       cssClasses: {item: ['col-sm-3']},
//       limit: 10,
//       sortBy: ['name:asc']
//     })
//   );

//   search.addWidget(
//     instantsearch.widgets.rangeSlider({
//       container: '#price',
//       attributeName: 'price',
//       pips: false,
//       tooltips: {format: function(rawValue) {return '$' + parseInt(rawValue)}}
//     })
//     );

//   search.addWidget(
//     instantsearch.widgets.googleMaps({
//       container: document.querySelector('#map'),
//       prepareMarkerData: function(hit, index, hits) {
//         return {
//           title: hit.name
//         };
//       }
//     })
//   );

//   search.start();
// });
