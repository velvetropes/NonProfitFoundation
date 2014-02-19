'use strict'

sfServices = angular.module("sfServices", ["ngResource"])

sfServices.factory "urlChooser", [->
  env = "development"
  # env = "staging"
  # env = "production"
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

  getDetailFormat = (id)->
    if env is "development" then "" else "/#{id}"
  {
    getUrl: getUrl()
    getIndexFormat: getIndexFormat()
  }
]

sfServices.factory "Article", ["$q", "$http", "urlChooser", ($q, $http, urlChooser) ->

  getDetail = (id) ->
    deferred = $q.defer()

    $http.get("#{urlChooser.getUrl}/articles/#{id}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getDetail: getDetail}
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

sfServices.factory "GalaItems", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/gala_items").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise

  {getIndex: getIndex}
]

# sfServices.factory "HearingMissionArticle", ["$resource", "urlChooser", ($resource, urlChooser) ->
#   $resource "#{urlChooser.getUrl}/missions/:articleId", {}, {}
# ]

sfServices.factory "HearingMissionArticle", ["$q", "$http", "urlChooser", ($q, $http, urlChooser) ->

  getDetail = (id) ->
    deferred = $q.defer()

    $http.get("#{urlChooser.getUrl}/missions_articles/#{id}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getDetail: getDetail}
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

sfServices.factory "MissionsPage", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getPage = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/missions_page#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getPage: getPage}
]

sfServices.factory "MissionsIndex", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    url = "#{urlChooser.getUrl}/missions_highlights#{urlChooser.getIndexFormat}"
    $http.get(url).success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getIndex: getIndex}
]

sfServices.factory "MissionsMapMarker", ["$q", "$http", "$resource", "urlChooser", ($q, $http, $resource, urlChooser) ->

  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/missions_markers#{urlChooser.getIndexFormat}").success((data) ->
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

sfServices.factory "PressRelease", ["$resource", "urlChooser", ($resource, urlChooser) ->
  $resource "#{urlChooser.getUrl}/press_releases/:pressReleaseId.json", {}, {}
]

sfServices.factory "MediaMention", ["$resource", "urlChooser", ($resource, urlChooser) ->
  $resource "#{urlChooser.getUrl}/media_mentions/:mediaMentionId.json", {}, {}
]


sfServices.factory "ProgramContent", ["$q", "$http", "urlChooser", ($q, $http, urlChooser) ->
  getResource = (programContentId)->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/program_#{programContentId}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getResource: getResource}
]

sfServices.factory "ProgramPartnership", ["$q", "$http", "urlChooser", ($q, $http, urlChooser) ->
  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/program_partnerships#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getIndex: getIndex}
]

sfServices.factory "ProgramResource", ["$q", "$http", "urlChooser", ($q, $http, urlChooser) ->
  getIndex = ->
    deferred = $q.defer()
    $http.get("#{urlChooser.getUrl}/program_resources#{urlChooser.getIndexFormat}").success((data) ->
      deferred.resolve data
    ).error (reason) ->
      deferred.reject reason
    deferred.promise
  {getIndex: getIndex}
]

sfServices.service("Youtube", [->
  regex = /(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/
  regex: ->
    regex
])