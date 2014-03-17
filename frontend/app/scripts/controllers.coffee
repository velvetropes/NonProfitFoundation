sfControllers = angular.module("sfControllers", [])

sfControllers.config ['$sceProvider', ($sceProvider) ->
  $sceProvider.enabled(false)
]

# Home

sfControllers.controller("globalCtrl", ["$scope", "$rootScope", "$location", "$timeout", ($scope, $rootScope, $location, $timeout) ->
  $scope.showModal = false
  $scope.videoIframe = ""
  $scope.showSubscribeForm = false

  # Make location available to get current url
  $rootScope.location = $location;

  if $location.url() is '/articles'
    $scope.blogOverview = true

  # Flag if we're loading a new route
  $scope.loadingRoute = false
  $scope.$on '$routeChangeStart', () ->
    $scope.loadingRoute = true
  $scope.$on '$routeChangeSuccess', () ->
    $scope.loadingRoute = false

  videoUrl = $location.search()['video']
  $scope.$on 'modal:hide', (event) ->
    $scope.showModal = false

  $scope.$on 'modal:show', (event, url) ->
    # ?video=ScjOkoueDYg
    $scope.showModal = not $scope.showModal
    if $scope.showModal is true
      displayModal(url)

  $timeout(->
    if videoUrl?
      $scope.showModal = true
      displayModal("http://www.youtube.com/watch?v=#{videoUrl}")
  ,1000)

  displayModal = (url) ->
    $scope.videoIframe = url

  $scope.toggleSubscribeForm = ->
    $scope.showSubscribeForm = not $scope.showSubscribeForm

  $scope.openSubscribeForm = ->
    $scope.showSubscribeForm = true
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
sfControllers.controller("BlogIndexCtrl", ["$scope", "$window", "Articles", "Pagination", "api_data", "$filter", ($scope, $window, Articles, Pagination, api_data, $filter) ->
  itemsPerPage = 9
  $scope.articleFilters = {
    featured:'false'
    blog_item_category: ''
    year: ''
  }
  $scope.windowWidth = $window.innerWidth

  $scope.articles = api_data.articles
  $scope.articleCategories = api_data.cats
  $scope.articleYears = api_data.years
  $scope.pagination = Pagination.getNew(itemsPerPage)
  $scope.nonFeaturedArticles = $filter('filter')($scope.articles, $scope.articleFilters)
  $scope.articlesForMobile = $scope.nonFeaturedArticles[0..itemsPerPage-1]
  $scope.pagination.numPages = Math.ceil($scope.nonFeaturedArticles.length/$scope.pagination.perPage)
  
  $scope.$watch "articleFilters.blog_item_category", ->
    $scope.nonFeaturedArticles = $filter('filter')($scope.articles, $scope.articleFilters)
    $scope.pagination.numPages = Math.ceil($scope.nonFeaturedArticles.length/$scope.pagination.perPage)
    return

  $scope.$watch "articleFilters.year", ->
    $scope.nonFeaturedArticles = $filter('filter')($scope.articles, $scope.articleFilters)
    $scope.pagination.numPages = Math.ceil($scope.nonFeaturedArticles.length/$scope.pagination.perPage)
    return

  $scope.numberOfPages = ->
    Math.ceil($scope.nonFeaturedArticles.length/$scope.pageSize)

  $scope.parseDate = (date) ->
    Date.parse(date)

  $scope.loadMore = ->
    $scope.pagination.nextPage()
    $scope.articlesForMobile = $scope.articlesForMobile.concat($scope.nonFeaturedArticles[currentPageCollection()..(currentPageCollection() + $scope.pagination.perPage)])

  isMobile = ->
    $scope.windowWidth < 768

  $scope.pageStart = ->
    if $scope.pagination?
      if isMobile()
        0
      else
        currentPageCollection()

  $scope.pageEnd = ->
    if $scope.pagination?
      if isMobile()
        ($scope.pagination.page+1) * $scope.pagination.perPage
      else
        $scope.pagination.perPage

  currentPageCollection = ->
    $scope.pagination.page * $scope.pagination.perPage

  $scope.isAtPaginationEnd = ->
    $scope.articlesForMobile.length >= $scope.nonFeaturedArticles.length

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
sfControllers.controller("MediaMentionsIndexCtrl", ["$scope", "MediaMentionOrPressItem", "Pagination", ($scope, MediaMentionOrPressItem, Pagination) ->

  $scope.articleFilters = {
    featured: ''
    year: ''
    type: ''
  }

  $scope.articleCategories = [
    {name: "All Articles", value: ''}
    {name: "Press Release", value: "press_release"}
    {name: "Media Mention", value: "media_mention"}
  ]

  $scope.articleYears = [
    {name: "Latest", value: ''}
    {name: '2014', value: '2014'}
    {name: '2013', value: '2013'}
    {name: '2012', value: '2012'}
    {name: '2011', value: '2011'}
    {name: '2010', value: '2010'}
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

  $scope.setTypeFilter = (filterObj)->
    $scope.articleFilters.type = filterObj.value

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

sfControllers.controller("MissionsIndexCtrl", ["$scope", "Pagination", "MissionsIndex", ($scope, Pagination, MissionsIndex) ->

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
    $scope.pagination = Pagination.getNew(9)
    $scope.pagination.numPages = Math.ceil($scope.missionsHighlights.length/$scope.pagination.perPage)

    $scope.highlightRegions = data.categories
    console.debug "$scope.highlightRegions", $scope.highlightRegions

    for year in data.years
      addedYear = {
        name: year
        value: year
      }
      $scope.highlightYears.push addedYear

  $scope.hideCountryDropdown = ->
    $scope.highlightsFilters.region==''

  $scope.$watch('currentRegion', (newVal, oldVal) ->
    if newVal?.region?.length > 0
      $scope.highlightsFilters.region = newVal.region
      $scope.highlightsFilters.country = ''
    else
      $scope.highlightsFilters.region = ''

  )

  $scope.numberOfPages = ->
    Math.ceil($scope.missionsHighlights.length/$scope.pageSize)

])

sfControllers.controller("MissionsShowCtrl", ["$scope", "$routeParams", "$location", "Articles", "HearingMissionArticle", "Pagination", ($scope, $routeParams, $location, Articles, HearingMissionArticle, Pagination) ->
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
