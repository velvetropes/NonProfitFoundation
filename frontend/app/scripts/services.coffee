blogPagesServices = angular.module("blogPagesServices", ["ngResource"])
appServices = angular.module("appServices", ["ngResource"])

blogPagesServices.factory "Article", ["$resource", ($resource) ->
  $resource "data/articles/:articleId.json", {},
    query:
      method: "GET"
      params:
        articleId: "index"
      isArray: true
]

appServices.factory "Category", ["$resource", ($resource) ->
  $resource "data/categories/index.json", {},
    query:
      method: "GET"
      isArray: true
]

mediaMentionsPagesServices = angular.module("mediaMentionsPagesServices", ["ngResource"])

mediaMentionsPagesServices.factory "MediaMention", ["$resource", ($resource) ->
  $resource "data/media_mentions/:mediaMentionId.json", {},
    query:
      method: "GET"
      params:
        mediaMentionId: "index"
      isArray: true
]

mediaMentionsPagesServices.factory "PressItem", ["$resource", ($resource) ->
  $resource "data/press_items/:pressItemId.json", {},
    query:
      method: "GET"
      params:
        pressItemId: "index"
      isArray: true
]
