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
    year: ''
  }

  $scope.articleCategories = [
    {name: "News", tag: "News"}
    {name: "Events", tag: "Events"}
    {name: "Hear Now", tag: "Hear Now"}
    {name: "Gala", tag: "Gala"}
    {name: "Films", tag: "Films"}
    {name: "Celebrity", tag: "Celebrity"}
    {name: "Operation Change", tag: "Operation Change"}
    {name: "Hearing Missions", tag: "Hearing Missions"}
    {name: "Listen Carefully", tag: "Listen Carefully"}
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
    year: ''
    type: ''
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
      {
        "background": "url(#{item.thumbnail_image_url})"
        "background-size": "cover"
      }
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

sfControllers.controller("ProgramsCtrl", ["$scope", "$routeParams", "$sce", "Articles", "ProgramPartnership", "ProgramResource", "ProgramContent", ($scope, $routeParams, $sce, Articles, ProgramPartnership, ProgramResource, ProgramContent) ->

  $scope.currentTab = $routeParams.tabId
  $scope.isVisible = false
  $scope.programPartnerships = []
  $scope.programResources = []
  $scope.programContent = ""

  ProgramContent.getResource($routeParams.tabId).then (data) ->
    $scope.programContent = data
    $scope.trustedHtml = $sce.trustAsHtml($scope.programContent)

  ProgramPartnership.getIndex().then (data) ->
    if data instanceof Array
      $scope.programPartnerships = data
    else
      $scope.programPartnerships = [data]
  ProgramResource.getIndex().then (data) ->
    if data instanceof Array
      $scope.programResources = data
    else
      $scope.programResources = [data]

  $scope.toggle = (marker)->
   marker = !marker
   $scope.isVisible = marker
   console.debug "toggle", $scope.isVisible

])