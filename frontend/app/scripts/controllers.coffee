sfControllers = angular.module("sfControllers", [])

sfControllers.config ['$sceProvider', ($sceProvider) ->
  $sceProvider.enabled(false)
]

# Home

sfControllers.controller("globalVideoModalCtrl", ["$scope",($scope) ->
  $scope.modalShown = false
  $scope.modalVideo = ""

  $scope.youtubeUrl = 'http://www.youtube.com/watch?v=WrO9PTpuSSs';
  $scope.codeExample1 = "<img ng-src='{{ youtubeUrl | youtubeImage }}'>"
  $scope.codeExample2 = "<iframe frameborder='0' ng-src='{{ youtubeUrl | youtubeIframe }}'></iframe>"

  $scope.$on 'modal:show', (event, url) ->
    $scope.toggleModal(url)

  $scope.toggleModal = (videoUrl)->
    $scope.modalShown = not $scope.modalShown
    if $scope.modalShown is true
      $scope.modalVideo = videoUrl
])

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

  $scope.modalShown = false
  $scope.toggleModal = ->
    $scope.modalShown = not $scope.modalShown
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

sfControllers.controller("BlogShowCtrl", ["$scope", "$routeParams", "$location", "$sce",  "Articles", "Article", "Pagination", ($scope, $routeParams, $location, $sce, Articles, Article, Pagination) ->

  $scope.currentPosition = $routeParams.articleId
  $scope.articles =[]

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

# Gala
sfControllers.controller("GalaCtrl", ["$scope", "$routeParams", ($scope, $routeParams ) ->

  $scope.currentTab = $routeParams
  console.debug "GalaCtrl: $scope.currentTab", $scope.currentTab
])

# Hearing Missions

sfControllers.controller("MissionsPageCtrl", ["$scope", "MissionsMapMarker", "MissionsPage", ($scope, MissionsMapMarker, MissionsPage) ->
  $scope.currentTab = 0
  MissionsMapMarker.getIndex().then (data) ->
    $scope.data = data
  MissionsPage.getPage().then (data) ->
    $scope.missions = data[0]
    $scope.statistics = $scope.missions.hearing_mission_statistics
    $scope.content_tabs = $scope.missions.content_tabs
    $scope.highlights = $scope.missions.highlights

  $scope.changeTab = (tabId) ->
    $scope.currentTab = tabId
])

sfControllers.controller("MissionsIndexCtrl", ["$scope", "Pagination", "MissionsIndex", ($scope, Pagination, MissionsIndex) ->

  $scope.highlightsFilters = {
    year: ''
    region: ''
    country: ''
  }

  $scope.highlightYears = [
    {name: "Latest", tag: ''}
    {name: '2014', tag: '2014'}
    {name: '2013', tag: '2013'}
    {name: '2012', tag: '2012'}
    {name: '2011', tag: '2011'}
    {name: '2010', tag: '2010'}
  ]

  $scope.highlightRegions = [
    {name: "Region", tag: ''}
    # TODO Read off JSON feed, collect all regions
  ]

  $scope.highlightCountries = [
    {name: "Country", tag: ''}
    # TODO Read off JSON feed, collect all regions
  ]

  $scope.missionsHighlights = []
  MissionsIndex.getIndex().then (data) ->
    $scope.missionsHighlights = data
    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.missionsHighlights.length/$scope.pagination.perPage)

  $scope.numberOfPages = ->
    Math.ceil($scope.missionsHighlights.length/$scope.pageSize)

])


sfControllers.controller("MissionsShowCtrl", ["$scope", "$routeParams", "$location", "Articles", "HearingMissionArticle", "Pagination", ($scope, $routeParams, $location, Articles, HearingMissionArticle, Pagination) ->

  # $scope.currentPosition = $
  # $scope.articles =[]
  # HearingMissionArticle.getDetail($routeParams.articleId).then (response) ->
  #   $scope.article = response.data

  # Articles.getIndex().then (data) ->
  #   if data instanceof Array
  #     $scope.articles = data
  #   else
  #     $scope.articles = [data]
  #   $scope.pagination = Pagination.getNew(9)
  #   $scope.pagination.numPages = Math.ceil($scope.articles.length/$scope.pagination.perPage)

  # $scope.numberOfPages = ->
  #   Math.ceil($scope.articles.length/$scope.pageSize)

  # $scope.parseDate = (date) ->
  #   parsedDate = Date.parse(date)
  #   parsedDate
])


# Media Mentions

sfControllers.controller("MediaMentionsIndexCtrl", ["$scope", "MediaMentionOrPressItem", "Pagination", ($scope, MediaMentionOrPressItem, Pagination) ->

  $scope.articleFilters = {
    featured: ''
    year: ''
    type: ''
  }

  $scope.articleCategories = [
    {name: "All", tag: ''}
    {name: "Press Release", tag: "press_release"}
    {name: "Media Mention", tag: "media_mention"}
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

  $scope.parseDate = (date) ->
    parsedDate = Date.parse(date)
    parsedDate
])

# TODO Change to detail page format
sfControllers.controller("MediaMentionsShowCtrl", ["$scope", "$routeParams", "MediaMention", "MediaMentionOrPressItem", "Pagination", ($scope, $routeParams, MediaMention, MediaMentionOrPressItem, Pagination) ->

  $scope.article = {
    prev_item: ""
    next_item: ""
  }

  $scope.currentPosition = $routeParams.articleId

  $scope.pressItems = []

  MediaMention.get(
    mediaMentionId: $routeParams.mediaMentionId
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

  $scope.parseDate = (date) ->
    parsedDate = Date.parse(date)
    parsedDate
])

# TODO Change to detail page
sfControllers.controller("PressReleasesShowCtrl", ["$scope", "$routeParams", "PressRelease", "MediaMentionOrPressItem", "Pagination", ($scope, $routeParams, PressRelease, MediaMentionOrPressItem, Pagination) ->

  $scope.article = {
    prev_item: ""
    next_item: ""
  }

  $scope.currentPosition = $routeParams.pressReleaseId

  $scope.pressItems = []

  PressRelease.get(
    pressReleaseId: $routeParams.pressReleaseId
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

  $scope.parseDate = (date) ->
    parsedDate = Date.parse(date)
    parsedDate
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