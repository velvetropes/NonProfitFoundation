# Controllers
blogPagesControllers = angular.module("blogPagesControllers", [])

blogPagesControllers.controller "BlogIndexCtrl", ["$scope", "Article", ($scope, Article) ->
  $scope.articleFilters = {
    featured:'false'
    blog_item_category: ''
  }

  $scope.articleCategories = [
    {name: "News", tag: "news"}
    {name: "Events", tag: "events"}
    {name: "Hear Now", tag: "hear_now"}
    {name: "Gala", tag: "gala"}
    {name: "Films", tag: "films"}
    {name: "Celebrity", tag: "celebrity"}
    {name: "Operation Change", tag: "operation_change"}
    {name: "Hearing Missions", tag: "hearing_missions"}
    {name: "Listen Carefully", tag: "listen_carefully"}
  ]

  $scope.articles = Article.query()
  $scope.currentPage = 0
  $scope.pageSize = 9
  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)
]

blogPagesControllers.controller "BlogShowCtrl", ["$scope", "$routeParams", "Article", ($scope, $routeParams, Article) ->

  $scope.article = Article.get(
    articleId: $routeParams.articleId
  , (article) ->
    #
  )
  $scope.articles = Article.query()

  $scope.currentPosition = 0
  $scope.currentPage = 0
  $scope.pageSize = 2
  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)
]