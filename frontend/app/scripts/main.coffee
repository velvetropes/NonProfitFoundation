# Blog
blogPagesApp = angular.module("blogPagesApp", ["ngRoute", "ngSanitize", "ahundredyears.thumblist-nav", "appServices", "blogPagesControllers", "blogPagesServices"])

blogPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/articles",
    templateUrl: "partials/articles/index.html"
    controller: "BlogIndexCtrl"
  ).when("/articles/:articleId",
    templateUrl: "partials/articles/show.html"
    controller: "BlogShowCtrl"
  ).otherwise redirectTo: "/articles"
]

blogPagesApp.filter "startFrom", ->
  (input, start) ->
    start = +start #parse to int
    input.slice start

# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", ["ngRoute", "ngSanitize", "ahundredyears.thumblist-nav", "appServices", "mediaMentionsPagesControllers", "mediaMentionsPagesServices"])

mediaMentionsPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/media_mentions",
    templateUrl: "partials/media_mentions/index.html"
    controller: "MediaMentionsIndexCtrl"
  ).when("/media_mentions/:articleId",
    templateUrl: "partials/media_mentions/show.html"
    controller: "MediaMentionsShowCtrl"
  ).otherwise redirectTo: "/media_mentions"
]

# TODO: DRY
mediaMentionsPagesApp.filter "startFrom", ->
  (input, start) ->
    start = +start #parse to int
    input.slice start

app = angular.module('starkey', ['ahundredyears.swiper', 'ahundredyears.thumblist-nav', 'ahundredyears.pagination'])

if $('.home-page').length
  $ ->
    $.getJSON "/data/markers.json", (data) ->

      $("#world-map-gdp").vectorMap
        map: "world_mill_en" #
        markers: data.coords
        markersSelectableOne: true
        zoomOnScroll: false
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
