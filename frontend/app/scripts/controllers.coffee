# Controllers

# Blog
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
  $scope.pageSize = 3
  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)
]

# Media Mentions

mediaMentionsPagesControllers = angular.module("mediaMentionsPagesControllers", [])

mediaMentionsPagesControllers.controller "MediaMentionsIndexCtrl", ["$scope", "PressItem", "Pagination", ($scope, PressItem, Pagination) ->

  $scope.pressItemFilters = {
    featured: 'false'
  }

  PressItem.getIndex().then (data) ->
    $scope.pressItems = data
    $scope.pagination = Pagination.getNew(3)
    $scope.pagination.numPages = Math.ceil($scope.pressItems.length/$scope.pagination.perPage)

  $scope.numberOfPages = ->
    Math.ceil($scope.pressItems.length/$scope.pageSize)
  $scope.backgroundStyle = (item) ->
    if item.quote?.length is 0
      {background: "url(#{item.thumbnail_image_url})"}
    else
      {background: '#5CA5D6'}
  $scope.isQuote = (item) ->
    item.quote.length > 0

]

mediaMentionsPagesControllers.controller "MediaMentionsShowCtrl", ["$scope", "$routeParams", "PressItem", ($scope, $routeParams, PressItem) ->
  $scope.article = PressItem.get(
    pressItemId: $routeParams.articleId
  , (pressItem) ->
    #
  )
  $scope.articles = PressItem.query()

  $scope.currentPage = 0
  $scope.pageSize = 9
  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)
]
