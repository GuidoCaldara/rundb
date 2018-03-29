function whiteStar(array){
  array.forEach(function(element){
    element.style.color = "#808080"
  })
}
const routeStars = Array.from(document.querySelectorAll(".route-star"))
const routeRateInput = document.getElementById('review_route_rate')

const organisationStars = Array.from(document.querySelectorAll(".organisation-star"))
const organisationRateInput = document.getElementById('review_organisation_rate')

const valueForMoneyStars = Array.from(document.querySelectorAll(".value-for-money-star"))
const valueForMoneyRateInput = document.getElementById('review_value_for_money')

function starRating(){

routeStars.forEach(function(star) {
  star.addEventListener('click', function () {
    whiteStar(routeStars)
    rate = routeStars.indexOf(star) + 1
    shortArray = routeStars.slice(0, rate)
    shortArray.forEach(function(element){
      element.style.color = "#97BF54"
      routeRateInput.value = `${rate}`
  })
});
});

organisationStars.forEach(function(star) {
  star.addEventListener('click', function () {
    whiteStar(organisationStars)
    rate = organisationStars.indexOf(star) + 1
    shortArray = organisationStars.slice(0, rate)
    shortArray.forEach(function(element){
      element.style.color = "#97BF54"
      organisationRateInput.value = `${rate}`
  })
});
});

valueForMoneyStars.forEach(function(star) {
  star.addEventListener('click', function () {
    whiteStar(valueForMoneyStars)
    rate = valueForMoneyStars.indexOf(star) + 1
    shortArray = valueForMoneyStars.slice(0, rate)
    shortArray.forEach(function(element){
      element.style.color = "#97BF54"
      valueForMoneyRateInput.value = `${rate}`
  })
});
});
}



export { starRating };
