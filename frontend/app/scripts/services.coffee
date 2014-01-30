'use strict'

sfServices = angular.module("sfServices", ["ngResource"])

sfServices.factory "Article", ["$resource", ($resource) ->
  $resource "/api/blog/:articleId", {},
    query:
      method: "GET"
      params:
        articleId: "index"
      isArray: true
]

# sfServices.factory "Category", ["$resource", ($resource) ->
#   $resource "data/categories/index.json", {},
#     query:
#       method: "GET"
#       isArray: true
# ]

sfServices.factory "PressItem", ["$resource", ($resource) ->
  $resource "/api/press/:pressItemId", {},
    query:
      method: "GET"
      params:
        pressItemId: "index"
      isArray: true
]

sfServices.factory "MediaMentionOrPressItem", ["$q", "$http", "$resource", ($q, $http, $resource) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("/api/press").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "MapMarker", ["$q", "$http", "$resource", ($q, $http, $resource) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("/api/homepage_markers").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "FeaturedArticle", ["$q", "$http", "$resource", ($q, $http, $resource) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("/api/featured_articles").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]
