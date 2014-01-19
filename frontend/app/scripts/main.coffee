app = angular.module('starkey', ['ahundredyears.swiper', 'ahundredyears.thumblist-nav', 'ahundredyears.pagination'])

app.controller 'bottomCarouselCtrl', ($scope) ->

app.controller 'heroCarouselCtrl', ($scope) ->

$ ->
  $.getJSON "/data/markers.json", (data) ->

    $("#world-map-gdp").vectorMap
      map: "world_mill_en" #
      markers: data.coords
      markersSelectableOne: true
      series:
        markers: [
          attribute: "fill"
          scale: ["#C8EEFF", "#0071A4"]
        ]

      onMarkerClick: (event, index) =>
        content = data.meta_data[index]
        $popup = $('#map-popup')
        $popup.fadeOut "slow", ->
          $popup
            .find(".content").empty()
            .html("<img src='#{content.thumbnail_url}'/><h1>#{content.title}</h1><p>#{content.text}</p>")
          $popup
            .fadeIn()
    mapObject = $("#world-map-gdp").vectorMap("get", "mapObject")

  $(document).on "click", "#map-popup .close a", (e) ->
    e.preventDefault()
    $('#map-popup').fadeOut()