sfControllers = angular.module("sfControllers", [])

sfControllers.config ['$sceProvider', ($sceProvider) ->
  $sceProvider.enabled(false)
]

# Home

sfControllers.controller("globalCtrl", ["$window", "$scope", "$rootScope", "$location", "$timeout", ($window, $scope, $rootScope, $location, $timeout) ->

  YOUTUBEPATTERN = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

  $scope.showModal = false
  $scope.videoIframe = ""
  $scope.showSubscribeForm = false

  $scope.location = $location

  # Make location available to get current url
  $rootScope.locationUrl = ->
    encodeURIComponent($location.absUrl())

  # We're using to let the blog index text appear before the view is loaded.
  if $location.url() is '/articles'
    $scope.blogOverview = true

  if $location.url() is '/thank_you'
    $scope.showThanks = true
    return

  $timeout(->
    videoUrl = ($location.search()).video
    if videoUrl?
      $scope.showModal = true
      displayModal("http://www.youtube.com/watch?v=#{videoUrl}")
    return
  , 500)


  # Flag if we're loading a new route
  $scope.loadingRoute = false
  $scope.$on '$routeChangeStart', () ->
    $scope.loadingRoute = true
  $scope.$on '$routeChangeSuccess', () ->
    $scope.loadingRoute = false
    if $location.url() is '/articles'
      $scope.blogOverview = true
    else
      $scope.blogOverview = false


  $scope.$on 'modal:hide', (event) ->
    if $location.$$search.video
      delete $location.$$search.video
      $location.$$compose()
    $scope.showModal = false

  $scope.$on 'modal:show', (event, url) ->
    $scope.showModal = not $scope.showModal
    if $scope.showModal is true
      displayModal(url)

  displayModal = (url) ->
    if url.match(YOUTUBEPATTERN)?
      $location.search('video', url.match(YOUTUBEPATTERN)[1])
    $scope.videoIframe = url

  $scope.directModalTrigger = (url) ->
    if url?
      $scope.showModal = true
      $scope.videoIframe = "http://www.youtube.com/watch?v=#{url.match(YOUTUBEPATTERN)[1]}"

  $scope.toggleSubscribeForm = ->
    $scope.showSubscribeForm = not $scope.showSubscribeForm

  $scope.openSubscribeForm = ->
    $scope.showSubscribeForm = true

  angular.element($window).bind 'resize', ->
    $timeout( ->
      $scope.$broadcast("window.resized", {})
    , 1100)

])

sfControllers.controller("HomeIndexBottomTabsCtrl", ["$scope", "MapMarker", "FeaturedArticle",($scope, MapMarker, FeaturedArticle) ->

  FeaturedArticle.getIndex().then (data) ->
    $scope.featuredArticlesHash = data

  MapMarker.getIndex().then (data) ->
    $scope.markers = data

  $scope.currentBottomSlideTab = 1

  $scope.currentTabModel = {}

  $scope.changeCurrentTab = (tabIndex) ->
    if tabIndex == 0
      $scope.currentBottomSlideTab = 1
    else
      $scope.currentBottomSlideTab = 2
      $scope.currentTabModel = $scope.featuredArticlesHash.articles[tabIndex-1]

  $scope.modalShown = false
  $scope.toggleModal = ->
    $scope.modalShown = not $scope.modalShown
])

# Blog
sfControllers.controller("BlogIndexCtrl", ["$scope", "$window", "Articles", "Pagination", "api_data", ($scope, $window, Articles, Pagination, api_data) ->
  $scope.blogArticles = api_data.articles
  $scope.blogFilters = api_data.filters
])

sfControllers.controller("BlogShowCtrl", ["$scope", "$routeParams", "$location", "$sce",  "Articles", "Article", "Pagination", "api_data",($scope, $routeParams, $location, $sce, Articles, Article, Pagination, api_data) ->

  $scope.currentPosition = $routeParams.articleId

  $scope.blogArticles = api_data.articles or []
  $scope.blogFilters = api_data.filters
])

sfControllers.controller("BlogPreviewCtrl", ["$scope", "$routeParams", "$location", "$sce",  "Articles", "Article", "Pagination", ($scope, $routeParams, $location, $sce, Articles, Article, Pagination) ->

  $scope.currentPosition = $routeParams.articleId

  $scope.blogArticles = []
  $scope.blogFilters = []

  Articles.getIndex().then((data) ->
    $scope.blogArticles = data.articles or []
    $scope.blogFilters = data.filters
  )

])

# Gala
sfControllers.controller("GalaCtrl", ["$scope", "$routeParams", "GalaItems", "GalaTabs" , ($scope, $routeParams, GalaItems, GalaTabs ) ->

  GalaItems.getIndex().then (data) ->
    $scope.timelineItems = data

  GalaTabs.getIndex().then (data) ->
    $scope.galaTabs = data
])

# Legal
sfControllers.controller("LegalPagesCtrl", ["$scope", "$routeParams", ($scope, $routeParams ) ->

  $scope.currentTab = 0

])

# Media Mentions
sfControllers.controller("MediaMentionsIndexCtrl", ["$scope", "$filter", "MediaMentionOrPressItem", "api_data", ($scope, $filter, MediaMentionOrPressItem, api_data) ->

  $scope.pressItems = api_data.articles
  $scope.pressFilters = api_data.filters

])

sfControllers.controller("MediaMentionsShowCtrl", ["$scope", "$routeParams", "MediaMention", "MediaMentionOrPressItem", "api_data", ($scope, $routeParams, MediaMention, MediaMentionOrPressItem, api_data) ->

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

  $scope.pressItems = api_data.articles
  $scope.pressFilters = api_data.filters
])

# Missions

sfControllers.controller("MissionsPageCtrl", ["$scope", "MissionsMapMarker", "MissionsPage", ($scope, MissionsMapMarker, MissionsPage) ->
  $scope.currentTab = 0
  MissionsMapMarker.getIndex().then (data) ->
    $scope.data = data
  MissionsPage.getPage().then (data) ->
    $scope.missions = data
    $scope.statistics = $scope.missions.hearing_mission_statistics
    $scope.content_tabs = $scope.missions.content_tabs
    $scope.highlights = $scope.missions.highlights

  $scope.changeTab = (tabId) ->
    $scope.currentTab = tabId
])

sfControllers.controller("MissionsIndexCtrl", ["$scope", "$filter", "Pagination", "MissionsIndex", ($scope, $filter, Pagination, MissionsIndex) ->

  $scope.highlightRegions = []
  $scope.currentRegion = {}
  $scope.missionsHighlights = []
  $scope.currentCountry = ''
  $scope.highlightsFilters = {
    year: ''
    region: ''
    country: ''
  }

  $scope.highlightYears = [
    {name: "Latest", value: ''}
  ]

  MissionsIndex.getIndex().then (data) ->
    $scope.missionsHighlights = data.highlights
    $scope.showPaginator = true
    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.missionsHighlights.length/$scope.pagination.perPage)

    $scope.highlightRegions = data.categories

    for year in data.years
      addedYear = {
        name: year.name
        value: year.value
      }
      $scope.highlightYears.push addedYear

    $scope.$watch "pagination", ->
      $scope.pageStart = $scope.pagination.page*$scope.perPage
      $scope.currentPage = $scope.pagination.page * $scope.pagination.perPage
      $scope.paginationUpperWindowLimit = $scope.pagination.upperWindowLimit()
      $scope.paginationLowerWindowLimit = $scope.pagination.lowerWindowLimit()
      return
    , true

    $scope.$watch "highlightsFilters", ->
      filteredList = $filter('filter')($scope.missionsHighlights, $scope.highlightsFilters)
      $scope.pagination.numPages = Math.ceil(filteredList.length/$scope.pagination.perPage)
      $scope.showPaginator = filteredList.length > 0
      return
    , true

  $scope.hideCountryDropdown = ->
    $scope.highlightsFilters.region=='' or $scope.highlightsFilters.region=='USA'

  $scope.$watch('currentRegion', (newVal, oldVal) ->
    if newVal?.region?.length > 0
      $scope.highlightsFilters.region = newVal.region
      $scope.highlightsFilters.country = ''
    else
      $scope.highlightsFilters.region = ''
  )

  $scope.numberOfPages = ->
    Math.ceil($scope.missionsHighlights.length/$scope.pageSize)

  $scope.paginationUpperWindowLimit = 0
  $scope.paginationLowerWindowLimit = 2

  $scope.isInPageRange = (n) ->
    thisPage = parseInt(n, 10)
    currentPage = $scope.pagination.page
    upToPage = currentPage + 2
    if thisPage in [$scope.paginationLowerWindowLimit..$scope.paginationUpperWindowLimit] then true else false

  $scope.continentName = (continent) ->
    if continent.is_us_map is "1"
      "USA"
    else
      continent.name
])

sfControllers.controller("MissionsShowCtrl", ["$scope", "$routeParams", "$location", "Articles", "HearingMissionArticle", "Pagination", ($scope, $routeParams, $location, Articles, HearingMissionArticle, Pagination) ->
])

sfControllers.controller("PressReleasesShowCtrl", ["$scope", "$routeParams", "PressRelease", "MediaMentionOrPressItem", "api_data", ($scope, $routeParams, PressRelease, MediaMentionOrPressItem, api_data) ->

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

  $scope.pressItems = api_data.articles
  $scope.pressFilters = api_data.filters
])

# Programs

sfControllers.controller("ProgramsCtrl", ["$scope", "$location", ($scope, $location) ->
  $scope.currentTab = $location.path()
  $scope.showForm = false

  $scope.$on('$routeChangeStart', ->
    $scope.currentTab = $location.path()
    return
  )

])

# Take Action

sfControllers.controller("TakeActionCtrl", ["$scope", "$routeParams", ($scope, $routeParams) ->

  $scope.currentTab = $routeParams
  $scope.showForm = false

  $scope.toggleForm = ->
    $scope.showForm = !$scope.showForm
])

# Preview
sfControllers.controller("PreviewShowCtrl", ["$scope", "$routeParams", "$sce",  "Preview", ($scope, $routeParams, $sce, Preview) ->
  Preview.getDetail($routeParams.articleId).then (data) ->
    $scope.article = data
])
