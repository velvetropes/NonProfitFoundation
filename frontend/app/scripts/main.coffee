app = angular.module('starkey', ['ahundredyears.swiper', 'ahundredyears.thumblist-nav', 'ahundredyears.pagination'])

app.controller 'bottomCarouselCtrl', ($scope) ->

app.controller 'heroCarouselCtrl', ($scope) ->

if $('.home-page').length
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
              .html("<span class='close'><a href='#'>X</a></span><img src='#{content.thumbnail_url}'/><div class='background-popup'><h1>#{content.title}</h1><p>#{content.text}</p></div>")
            $popup
              .fadeIn()
      mapObject = $("#world-map-gdp").vectorMap("get", "mapObject")

    $(document).on "click", "#map-popup .close a", (e) ->
      e.preventDefault()
      $('#map-popup').fadeOut()