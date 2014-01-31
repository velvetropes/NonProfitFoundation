'use strict'

sfServices = angular.module("sfServices", ["ngResource"])

sfServices.factory "Article", ["$resource", ($resource) ->
  $resource "/api/blog/:articleId.json", {}, {}
  # $resource "http://starkey.local/api/blog/:articleId.json", {}, {}
  # $resource "/local/api/blog/:articleId.json", {}, {}
]

sfServices.factory "Articles", ["$q", "$http", "$resource", ($q, $http, $resource) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("/api/blog").success((data) ->
    # $http.get("http://starkey.local/api/blog").success((data) ->
    # $http.get("/local/api/blog/index.json").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "PressItem", ["$resource", ($resource) ->
  $resource "/api/press/:pressItemId.json", {}, {}
  # $resource "http://starkey.local/api/press/:pressItemId.json", {}, {}
  # $resource "/local/api/press/:pressItemId.json", {}, {}
]

sfServices.factory "MediaMentionOrPressItem", ["$q", "$http", "$resource", ($q, $http, $resource) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("/api/press").success((data) ->
    # $http.get("http://starkey.local/api/press").success((data) ->
    # $http.get("/local/api/press/index.json").success((data) ->
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
    # $http.get("http://starkey.local/api/homepage_markers").success((data) ->
    # $http.get("/local/api/homepage_markers/index.json").success((data) ->
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
    # $http.get("http://starkey.local/api/featured_articles").success((data) ->
    # $http.get("/local/api/featured_articles/index.json").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]
