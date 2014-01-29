# Blog
blogPagesApp = angular.module("blogPagesApp", [
  "ngRoute",
  "ngSanitize",
  "ahundredyears.swiper",
  "ahundredyears.thumblist-nav",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

blogPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/articles",
    templateUrl: "partials/articles/index.html"
    controller: "BlogIndexCtrl"
  ).when("/articles/:articleId",
    templateUrl: "partials/articles/show.html"
    controller: "BlogShowCtrl"
  ).otherwise redirectTo: "/articles"
]

# Media Mentions
mediaMentionsPagesApp = angular.module("mediaMentionsPagesApp", [
  "ngRoute",
  "ngSanitize",
  "ahundredyears.swiper",
  "ahundredyears.thumblist-nav",
  "sfControllers",
  "sfDirectives",
  "sfFilters",
  "sfServices"
])

mediaMentionsPagesApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/media_mentions",
    templateUrl: "partials/media_mentions/index.html"
    controller: "MediaMentionsIndexCtrl"
  ).when("/media_mentions/:articleId",
    templateUrl: "partials/media_mentions/show.html"
    controller: "MediaMentionsShowCtrl"
  ).otherwise redirectTo: "/media_mentions"
]

app = angular.module('starkey', [
  'ahundredyears.pagination',
  'ahundredyears.swiper',
  'ahundredyears.thumblist-nav'
])

if $('.home-page').length
  $ ->
    $.getJSON "/api/homepage_markers", (data) ->

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
