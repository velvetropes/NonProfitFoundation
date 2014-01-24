# Controllers
blogPagesControllers = angular.module("blogPagesControllers", [])

blogPagesControllers.controller "BlogIndexCtrl", ["$scope", "Article", ($scope, Article) ->
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
  $scope.currentPage = 0
  $scope.pageSize = 2
  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)
]