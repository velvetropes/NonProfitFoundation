sfControllers = angular.module("sfControllers", [])

# Home



sfControllers.controller("HomeIndexBottomTabsCtrl", ["$scope", "MapMarker", "FeaturedArticle",($scope, MapMarker, FeaturedArticle) ->

  FeaturedArticle.getIndex().then (data) ->
    $scope.featuredArticles = data

  MapMarker.getIndex().then (data) ->
    $scope.markers = data

  $scope.currentBottomSlideTab = 1

  $scope.currentTabModel = {}

  $scope.changeCurrentTab = (tabIndex) ->
    if tabIndex == 0
      $scope.currentBottomSlideTab = 1
    else
      $scope.currentBottomSlideTab = 2
      $scope.currentTabModel = $scope.featuredArticles[tabIndex-1]
])

# Blog

sfControllers.controller("BlogIndexCtrl", ["$scope", "Articles", "Pagination", ($scope, Articles, Pagination) ->
  $scope.articles =[]
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

  Articles.getIndex().then (data) ->
    if data instanceof Array
      $scope.articles = data
    else
      $scope.articles = [data]

    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.articles.length/$scope.pagination.perPage)

  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)

])

sfControllers.controller("BlogShowCtrl", ["$scope", "$routeParams", "Articles", "Article", "Pagination", ($scope, $routeParams, Articles, Article, Pagination) ->

  $scope.articles =[]
  Article.get(
    articleId: $routeParams.articleId
  , (article) ->
    if article instanceof Array
      $scope.article = article[0]
    else
      $scope.article = article
  )

  Articles.getIndex().then (data) ->
    if data instanceof Array
      $scope.articles = data
    else
      $scope.articles = [data]
    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.articles.length/$scope.pagination.perPage)

  $scope.numberOfPages = ->
    Math.ceil($scope.articles.length/$scope.pageSize)

])

# Media Mentions

sfControllers.controller("MediaMentionsIndexCtrl", ["$scope", "MediaMentionOrPressItem", "Pagination", ($scope, MediaMentionOrPressItem, Pagination) ->

  $scope.pressItemFilters = {
    featured: 'false'
  }

  $scope.pressItems = []
  MediaMentionOrPressItem.getIndex().then (data) ->
    $scope.pressItems = data
    $scope.pagination = Pagination.getNew(9)
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

])

sfControllers.controller("MediaMentionsShowCtrl", ["$scope", "$routeParams", "PressItem", "MediaMentionOrPressItem", "Pagination", ($scope, $routeParams, PressItem, MediaMentionOrPressItem, Pagination) ->

  $scope.pressItems = []
  PressItem.get(
    pressItemId: $routeParams.articleId
  , (pressItem) ->
    if pressItem instanceof Array
      $scope.article = pressItem[0]
    else
      $scope.article = pressItem
  )

  MediaMentionOrPressItem.getIndex().then (data) ->
    $scope.pressItems = data
    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.pressItems.length/$scope.pagination.perPage)

  $scope.numberOfPages = ->
    Math.ceil($scope.pressItems.length/$scope.pageSize)

])

# Programs

sfControllers.controller("ProgramsCtrl", ["$scope", "Articles", ($scope, Articles) ->
  $scope.isVisible = false
  $scope.currentTab = 0

  Articles.getIndex().then (data) ->
    if data instanceof Array
      $scope.articles = data
    else
      $scope.articles = [data]

  $scope.toggle = (marker)->
   marker = !marker
   $scope.isVisible = marker

  $scope.changeTabTo = (tabIndex) ->
    $scope.currentTab = tabIndex

])