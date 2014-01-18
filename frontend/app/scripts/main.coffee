app = angular.module('starkey', ['ahundredyears.swiper', 'ahundredyears.thumblist-nav', 'ahundredyears.pagination'])

app.controller 'bottomCarouselCtrl', ($scope) ->

app.controller 'heroCarouselCtrl', ($scope) ->

$("#world-map-gdp").vectorMap
  map: "world_mill_en"
  zoomOnScroll: false
  series:
    regions: [
      values: []
      scale: ["#C8EEFF", "#0071A4"]
      normalizeFunction: "polynomial"
    ]
