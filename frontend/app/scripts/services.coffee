blogPagesServices = angular.module("blogPagesServices", ["ngResource"])

blogPagesServices.factory "Article", ["$resource", ($resource) ->
  $resource "data/articles/:articleId.json", {},
    query:
      method: "GET"
      params:
        articleId: "index"
      isArray: true
]