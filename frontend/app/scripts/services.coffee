'use strict'

sfServices = angular.module("sfServices", ["ngResource"])

sfServices.factory "urlChooser", [->
  # env = "development"
  # env = "staging"
  env = "production"
  urlChooserInstance = {}
  getUrl = ->
    switch env
      when "development"
        "/local/api"
      when "staging"
        "http://starkey.local/api"
      else
        "/api"
  getIndexFormat = ->
    if env is "development" then "/index.json" else ""
  {
    getUrl: getUrl()
    getIndexFormat: getIndexFormat()
  }
]

sfServices.factory "Article", ["$resource", "urlChooser", ($resource, urlChooser) ->
  $resource "#{urlChooser.getUrl}/blog/:articleId.json", {}, {}
]

sfServices.factory "Articles", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()

    $http.get("#{urlChooser.getUrl}/blog#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "FeaturedArticle", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/featured_articles#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  {getIndex: getIndex}
]


sfServices.factory "MapMarker", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/homepage_markers#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "MediaMentionOrPressItem", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/press#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason

    deferred.promise

  # Return factory object
  {getIndex: getIndex}
]

sfServices.factory "PressItem", ["$resource", "urlChooser", ($resource, urlChooser) ->
  $resource "#{urlChooser.getUrl}/press/:pressItemId.json", {}, {}
]

sfServices.factory "ProgramPartnership", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->
  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/program_partnerships#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getIndex: getIndex}
]

sfServices.factory "ProgramResource", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->
  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/program_resources#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getIndex: getIndex}
]