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
    {name: "All", tag: ''}
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

  $scope.articleYears = [
    {name: "Latest", tag: ''}
    {name: '2014', tag: '2014'}
    {name: '2013', tag: '2013'}
    {name: '2012', tag: '2012'}
    {name: '2011', tag: '2011'}
    {name: '2010', tag: '2010'}
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

  $scope.parseDate = (date) ->
    parsedDate = Date.parse(date)
    parsedDate
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

  $scope.parseDate = (date) ->
    parsedDate = Date.parse(date)
    parsedDate
])

# Media Mentions

sfControllers.controller("MediaMentionsIndexCtrl", ["$scope", "MediaMentionOrPressItem", "Pagination", ($scope, MediaMentionOrPressItem, Pagination) ->

  $scope.articleFilters = {
    featured: 'false'
    year: ''
    type: ''
  }

  $scope.articleCategories = [
    {name: "All", tag: ''}
    {name: "Press Release", tag: "Press Release"}
    {name: "Media Mention", tag: "Media Mention"}
  ]

  $scope.articleYears = [
    {name: "Latest", tag: ''}
    {name: '2014', tag: '2014'}
    {name: '2013', tag: '2013'}
    {name: '2012', tag: '2012'}
    {name: '2011', tag: '2011'}
    {name: '2010', tag: '2010'}
  ]

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

sfControllers.controller("ProgramsCtrl", ["$scope", "$routeParams", "Articles", "ProgramPartnership", "ProgramResource", ($scope, $routeParams, Articles, ProgramPartnership, ProgramResource) ->

  $scope.currentTab = $routeParams

  $scope.programPartnerships = []
  $scope.programResources = []

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

])