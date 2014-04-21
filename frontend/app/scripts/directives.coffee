sfDirectives = angular.module("sfDirectives", ["ngSanitize", "sfFilters"])

# open external links in new window
sfDirectives.directive 'href', ["$location", "$parse", ($location, $parse) ->
  require: "a"
  link = (scope, element, attrs) ->
    url = attrs.href

    # if not a mailto link and actually has an href value
    if url.lastIndexOf('mailto:', 0) isnt 0 and url.length > 0

      # Check if external domain
      match = url.match(/^([^:\/?#]+:)?(?:\/\/([^\/?#]*))?([^?#]+)?(\?[^#]*)?(#.*)?/)
      if match? and typeof match[2] is "string" and match[2].length > 0 and match[2].toLowerCase() isnt $location.host()
        element.attr('target', '_blank')

      else
        # Check if file link
        match = url.match(/\.([0-9a-z]+)(?:[\?#]|$)/)
        if match? and typeof match[1] is "string" and match[1].length > 0 and match[1].toLowerCase() isnt 'html'
          element.attr('target', '_blank')
    return
]

sfDirectives.directive "accordion", [->
  template = """
    <div class="accordion" ng-transclude></div>
    """
  restrict: "EA"
  replace: true
  transclude: true
  template: template
  controller: ->
    expanders = []
    @gotOpened = (selectedExpander) ->
      angular.forEach expanders, (expander) ->
        expander.showMe = false  unless selectedExpander is expander
        return
      return

    @addExpander = (expander) ->
      expanders.push expander
      return
    return
]

sfDirectives.directive "accordionList", [->
  link = (scope, element, attrs) ->

  template = """
    <div class="accordion-list">
      <h3>{{title}}</h3>
      <ul ng-transclude></ul>
    </div>
    """
  restrict: "EA"
  replace: true
  transclude: true
  template: template
  link: link
  scope:
    title: "@"
]

sfDirectives.directive "accordionListItem", [->
  link = (scope, element, attrs) ->

  template = """
    <li class="accordion-list-item">
      <h3>{{title}}</h3>
      <h3>{{subhead}}</h3>
      <div ng-transclude></div>
    </li>
    """
  restrict: "EA"
  replace: true
  transclude: true
  template: template
  link: link
  scope:
    title: "@"
    subhead: "@"
]

# Dropdown
sfDirectives.directive "dropdown", [ ->

  link = (scope, element, attrs) ->
    scope.isActive = false
    scope.currentOption = scope.options[0] or {}

  controller = ($scope) ->
    dropdownOptions = []
    @gotSelected = (selectedDropdownOption) ->
      angular.forEach dropdownOptions, (dropdownOption) ->
        if selectedDropdownOption is dropdownOption
          $scope.currentOption = selectedDropdownOption
          $scope.callFilter = $scope.currentOption.value
        else
          dropdownOption.isCurrent = false
        return
      return

    @addDropdownOption = (dropdownOption) ->
      dropdownOptions.push dropdownOption
      return
    return

  result =
    restrict: "EA"
    transclude: true
    replace: true
    controller: controller
    templateUrl: "/templates/dropdown.html"
    link: link
    scope:
      options: "="
      callFilter: "="
  result
]

sfDirectives.directive "dropdownOption", [ ->

  link = (scope, element, attrs, dropdownController) ->
    scope.isSelected = false
    dropdownController.addDropdownOption scope
    scope.selectOption = ->
      scope.isSelected = not scope.isSelected
      dropdownController.gotSelected scope
      return
    return

  result =
    restrict: "E"
    replace: true
    require: "^?dropdown"
    template: """
      <li>
        <a href ng-click="selectOption()">{{name}}</a>
      </li>
      """
    link: link
    scope:
      name: "@"
      value: "@"
  result
]

sfDirectives.directive "expander", [->
  templateUrl: "/templates/expander.html"
  restrict: "EA"
  replace: true
  transclude: true
  require: "^?accordion"
  link: (scope, element, attrs, accordionController) ->
    scope.showMe = false
    accordionController.addExpander scope
    scope.toggle = toggle = ->
      scope.showMe = not scope.showMe
      accordionController.gotOpened scope
      return
    return
  scope:
    title: "@"
]

sfDirectives.directive 'dynamic', ["$compile", ($compile) ->
  restrict: 'A'
  replace: true
  link: (scope, element, attrs) ->
    scope.$watch(attrs.dynamic, (html) ->
      element.html(html)
      $compile(element.contents())(scope)
    )
]

# Facebook
sfDirectives.directive("facebook", [
  "$timeout"
  "$http"
  ($timeout, $http) ->
    return {
      restrict: "E"
      scope:
        url: "@"
        caption: "@"
      replace: true
      templateUrl: "/templates/facebook.html"
      link: (scope, element, attr) ->
        scope.shares = 0
        endpoint = "http://graph.facebook.com/fql?q=SELECT total_count FROM link_stat WHERE url='http://www.facebook.com/starkeycares'"
        $http.get(endpoint).success((res) ->
          scope.shares = res.data[0].total_count
        ).error (res, status) ->
          scope.shares = 0
    }
])

# <gala-thumblist-nav items="timelineItems"></gala-thumblist-nav>

sfDirectives.directive 'galaThumblistNav', ["$http", "$sce", "$timeout", ($http, $sce, $timeout) ->
  config = {}

  _initScrollPane = (scope, element) ->
    $timeout( ->
      scope.pane = angular.element('.thumblist-nav').jScrollPane()
      scope.api = scope.pane.data().jsp unless scope.pane.data() is null
      return
    , 400)

  link = (scope, element, attrs) ->
    _initScrollPane(scope, element)
    scope.$watch (->
      element.find(".gala-item").length
    ), (length) ->
      $timeout( ->
        if scope.api?
          scope.api.reinitialise()
        return
      , 400)

    scope.$on("window.resized", (event, args) ->
      angular.element('.thumblist-nav').jScrollPane().data().jsp.destroy()
      _initScrollPane(scope, element)
    )
    return


  controller = ($scope, $element) ->
    $scope.getItem = (url)->
      $http.get("/api/gala_item/#{url}").then (response) ->
        # $http.get("/local/api/gala_item").then (response) ->
        $scope.rawHtml = response.data

  controller: controller
  restrict: "E"
  link: link
  templateUrl: "/templates/gala_thumblist_nav.html"
  replace: true
  scope:
    items: "="
]

# <gallery></gallery>

sfDirectives.directive "gallery", [ "$timeout", ($timeout) ->

  _initScrollPane = (scope, element) ->
    $timeout( ->
      scope.pane = angular.element('.gallery').jScrollPane()
      scope.api = scope.pane.data().jsp unless scope.pane.data() is null
      return
    , 400)

  link = (scope, element, attrs) ->
    scope.slides ?= 1

    scope.isThumblist = ->
      scope.slides > 1

    config = { showArrows: true}

    scope.isFullHeight = ->
      scope.full?.length > 0 and scope.full is "true"

    scope.galleryClasses = ->
      if scope.isThumblist()
        "gallery"
      else
        "single-image-gallery"

    # So thumblist stretches full-width
    element.parent().addClass("no-container") if element.parent()?.is("p")

    if scope.isThumblist()

      _initScrollPane(scope, element)
      scope.$watch (->
        element.find(".gallery-slide").length
      ), (length) ->
        $timeout( ->
          if scope.api?
            scope.api.reinitialise()
          return
        , 400)

      scope.$on("window.resized", (event, args) ->
        angular.element('.gallery').jScrollPane().data().jsp.destroy()
        _initScrollPane(scope, element)
      )
    return

  template = """
    <div ng-class="galleryClasses()" ng-transclude></div>
    """
  restrict: "EA"
  link: link
  template: template
  transclude: true
  replace: true
  scope:
    slides: "@"
]

# Gallery slide directive format:
# <gallery-slide
#  image-url=""
#  video-url=""
# ></gallery-slide>

sfDirectives.directive "gallerySlide", ["$location", ($location) ->

  link = (scope, element, attrs) ->
    scope.imageUrl ?= ""
    scope.videoUrl ?= ""
    scope.single ?= false

    scope.youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

    scope.youtubeId = ->
      scope.videoUrl.match(scope.youtubePattern)[1]

    scope.hasImageUrl = ->
      scope.imageUrl?.length > 0

    scope.hasVideo = ->
      scope.videoUrl?.length > 0

    scope.getYoutubeVideoThumbnail = ->
      if scope.hasVideo()
        "http://img.youtube.com/vi/#{scope.youtubeId()}/1.jpg"

    scope.getImage = ->
      # Use imageUrl, and fall back to videoUrl thumb otherwise
      scope.imageUrl or scope.getYoutubeVideoThumbnail()

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        # Send videoUrl to overlay
        scope.$emit('modal:show', scope.videoUrl)
        $location.url($location.url() + '?video=' + scope.youtubeId())

    scope.slideType = ->
      if scope.hasVideo() then "links_to_video" else "plain_image"

    scope.slideClasses = ->
      classes = scope.hasVideo()
      if scope.single
        classes += ' single'
      classes

    scope.backgroundImageStyle = ->
      if (scope.single)
        {
          'background-image': 'url(' + scope.getImage() + ')'
          'background-size': 'cover'
          'background-position': '50% 50%'
        }

    scope.imageStyle =
      {
        'width': '530px'
      }

  result =
    restrict: "EA"
    replace: true
    templateUrl:
      "/templates/gallery_slide.html"
    link: link
    scope:
      imageUrl: "@"
      videoUrl: "@"
      single: "@"
  result

]

sfDirectives.directive 'resizer', [->
  restrict: "A"
  link: (scope, elem, attr) ->
    elem.on "load", ->
      fixedHeightValue = 525
      ratio = $(this).height()/520
      w = $(this).width()
      h = $(this).height()
      elem.css
        "width": "#{Math.round(w/ratio)}px"
        "height": "525px"
]

sfDirectives.directive 'homeThumblistNav', ["$timeout", ($timeout) ->
  _initScrollPane = (scope, element) ->
    $timeout( ->
      scope.pane = angular.element('.thumblist-nav').jScrollPane()
      scope.api = scope.pane.data().jsp unless scope.pane.data() is null
      return
    , 400)

  link = (scope, element, attrs) ->
    _initScrollPane(scope, element)

    scope.$on("window.resized", (event, args) ->
      angular.element('.thumblist-nav').jScrollPane().data().jsp.destroy()
      _initScrollPane(scope, element)
    )
    return

  return {
    restrict: "EA"
    link: link
    templateUrl: "/templates/home_thumblist_nav.html"
    replace: true
    scope:
      featured: "="
      clickaction: "="
  }
]

sfDirectives.directive 'jscrollpaneList', ["$timeout", ($timeout) ->
  (scope, element, attrs) ->
    if scope.$last
      $timeout( ->
        angular.element('.thumblist-nav').jScrollPane()
      , 400)
    return
]

sfDirectives.directive("instagramGallery", [
  "$http"
  "Instagram"
  ($http, Instagram) ->
    return {
      restrict: "EA"
      scope: {}
      replace: true
      templateUrl: "/templates/instagram_gallery.html"
      link: (scope, element, attr) ->
        scope.pics = []
        Instagram.fetchLatest( (data) ->
          scope.pics = data
        )
    }
])

sfDirectives.directive("latestBlogPost", [
  "$http"
  "LatestBlog"
  ($http, LatestBlog) ->
    return {
      restrict: "EA"
      scope: {}
      replace: true
      templateUrl: "/templates/latest_blog_post.html"
      link: (scope, element, attr) ->
        scope.article = {}
        LatestBlog.fetchLatest().then (data) ->
          scope.article = data

    }
])

# Missions Map
sfDirectives.directive "missionsMap", ["$timeout", ($timeout)->
  link = (scope, element, attrs) ->
    scope.worldMapObject = {}
    scope.usMapObject = {}
    scope.worldMapZIndex = 1
    scope.usMapZIndex = 0
    scope.currentContinent = {}
    scope.currentCountry = {}
    scope.selectedList = {}
    scope.greetingFlag = false

    scope.mapConfig =
      # regionsSelectable: true
      zoomOnScroll: false
      backgroundColor: "none"
      regionStyle:
        selected:
          fill: "#ffad20"
      focusOn:
        x: 0.5,
        y: 0.5,
        scale: .5
      backgroundColor: "#329FD6"

      # onRegionSelected: (e, str) ->
      #   console.debug "Clicked", str

    scope.worldMapConfig = _.extend({map: "world_mill_en2"}, scope.mapConfig)
    scope.usMapConfig = _.extend({map: "us_aea_en"}, scope.mapConfig)

    scope.selectTopLevelList = (continent) ->
      scope.selectedList = continent
      scope.greetingFlag = true

    scope.initializeMaps = ->
      $timeout( ->
        angular.element("#missions-world-map").vectorMap(scope.worldMapConfig)
        scope.worldMapObject = angular.element("#missions-world-map").vectorMap("get", "mapObject")

        angular.element("#missions-us-map").vectorMap(scope.usMapConfig)
        scope.usMapObject = angular.element("#missions-us-map").vectorMap("get", "mapObject")
        return
      , 500)

      $timeout( ->
        scope.worldMapObject.setFocus(1.15, 0.82, 0.47)
        return
      , 600)

      return

    scope.hasContinentAndCountry = ->
      scope.hasContinent() or scope.hasCountry()

    scope.hasContinent = ->
      scope.currentContinent?.name?

    scope.hasCountry = ->
      scope.currentCountry?.name?

    scope.continentIsVisible = (continent) ->
      parseInt(continent.total_hearing_aids_provided, 10) > 0

    scope.countryClass = (continent) ->
      if continent.is_us_map? and continent.is_us_map is 1
        "states"
      else
        "countries"

    scope.countryOrState = ->
      scope.countryClass(scope.currentContinent.name) if scope.hasContinent()

    scope.highlightContinentRegions = (continent, mapObj) ->
      scope.currentContinent = continent
      scope.currentCountry = {}
      countryCodes = []
      countryCodes.push country.abbreviation for country in continent.countries_visited
      if countryCodes.length > 0
        mapObj.clearSelectedRegions()
        mapObj.setFocus(countryCodes, .2)
        mapObj.setSelectedRegions(countryCodes)
      return

    scope.highlightCountryRegion = (country, mapObj) ->
      scope.currentCountry = country
      mapObj.clearSelectedRegions()
      mapObj.setFocus country.abbreviation
      mapObj.setSelectedRegions country.abbreviation

    scope.bringUSMapToFront = (flag, continent) ->
      if flag is true
        scope.worldMapZIndex = 0
        scope.usMapZIndex = 1
        scope.highlightContinentRegions(continent, scope.usMapObject)

      else
        scope.worldMapZIndex = 1
        scope.usMapZIndex = 0
        scope.highlightContinentRegions(continent, scope.worldMapObject)

    scope.greetingClicked = ->
      scope.greetingFlag = true

    scope.continentName = (continent) ->
      if continent.is_us_map? and continent.is_us_map is "1"
        "USA"
      else
        continent.name
    scope.initializeMaps()

  controller = ($scope, $element) ->

    $scope.showContinent = (continent) ->
      if continent.is_us_map is "1"
        $scope.bringUSMapToFront(true, continent)
      else
        $scope.bringUSMapToFront(false, continent)
      return

    $scope.showCountry = (country, continent) ->
      countryCode = country.abbreviation
      if countryCode?.length > 0 and country.total_hearing_aids_provided?.length > 0
        if continent.is_us_map is "1"
          $scope.bringUSMapToFront(true, continent)
          $scope.highlightCountryRegion(country, $scope.usMapObject)
        else
          $scope.bringUSMapToFront(false, continent)
          $scope.highlightCountryRegion(country, $scope.worldMapObject)
      return

  restrict: "E"
  link: link
  controller: controller
  templateUrl: "/templates/missions_map.html"
  replace: true
  scope:
    data: "="
]

# Scroll detection for persistent nav
sfDirectives.directive "navscrollspy", ($window) ->
  (scope, element, attrs) ->
    angular.element($window).bind "scroll", ->
      if @pageYOffset >= 120
        scope.passed = true
      else
        scope.passed = false
      scope.$apply()
      return
    return

# Page tile format:
# < page-tile
#   id=""
#   feed_url=""
#   title=""
#   date=""
#   year=""
#   detail_page=""
#   type=""
#   featured=""
#   header_image_url=""
#   logo_image_url=""
#   quote=""
#   call_to_action_text=""
#   call_to_action_link=""
#   video_link=""
# ></page-tile>

sfDirectives.directive "pageTile", [ ->

  link = (scope, element, attrs) ->
    scope.feedUrl ?= ""
    scope.title ?= ""
    scope.date ?= ""
    scope.year ?= ""
    scope.detailPage ?= ""
    scope.type ?= ""
    scope.featured ?= ""
    scope.headerImageUrl ?= ""
    scope.logoImageUrl ?= ""
    scope.quote ?= ""
    scope.callToActionText ?= ""
    scope.callToActionLink ?= ""
    scope.videoLink ?= ""

    scope.getFormat = ->
      if typeof scope.dateFormat isnt "undefined"
        scope.dateFormat
      else
        "MMMM d, yyyy"

    scope.hasVideo = ->
      scope.videoLink?.length > 0

    scope.getCategory = ->
      switch scope.type
        when "press_release"
          "Press Release"
        when "media_mention"
          "Media Mention"
        else
          scope.category

    scope.parseDate = (date) ->
      Date.parse(date)

    scope.linkByType = ->
      if scope.type?
        if scope.type is "media_mention"
          if scope.videoLink?.length > 0
            "media_mention_with_video"
          else if scope.detailPage?.length > 0 and scope.detailPage is "true"
            "media_mention_with_detail_page"
          else
            "media_mention"
        else
          scope.type
      else
        "default"

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        scope.$emit('modal:show', scope.videoLink)

  result =
    restrict: "E"
    replace: true
    templateUrl: "/templates/page_tile.html"
    link: link
    scope:
      id: "@"
      callToActionLink: "@"
      callToActionText: "@"
      category: "@"
      date: "@"
      dateFormat: "="
      detailPage: "@"
      featured: "@"
      feedUrl: "@"
      headerImageUrl: "@"
      logoImageUrl: "@"
      quote: "@"
      title: "@"
      type: "@"
      videoLink: "@"
      year: "@"
  result

]

# Paginated Article List
sfDirectives.directive "paginatedArticleList", ["$filter", "Pagination", ($filter, Pagination) ->

  _composeFilterObject = (filters) ->
    labels = _.pluck(filters, 'label')
    filterObject = {}
    filterObject[l] = "" for l in labels
    filterObject

  _composePaginationSettings = (scope) ->
    pagination = Pagination.getNew(scope.perPage)
    pagination.numPages = 0
    pageConfig = _.extend {pagination}, {
      isAtPaginationEnd: false
      currentPage: 0
      pageStart: 0
    }
    return pageConfig

  _updatePaginationWindowLimits = (scope) ->
    scope.paginationUpperWindowLimit = scope.pagination.upperWindowLimit()
    scope.paginationLowerWindowLimit = scope.pagination.lowerWindowLimit()

  _setupWatchers = (scope) ->

    scope.$watch "articlesFilterObject", ->
      scope.filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.pagination.numPages = Math.ceil(scope.filteredList.length/scope.pagination.perPage)
      scope.isAtPaginationEnd = (scope.mobileStop >= scope.filteredList.length)
      scope.showPaginator = if scope.filteredList.length == 0
        false
      else
        scope.articles.length > scope.pagination.perPage
      return
    , true

    scope.$watch "articles", ->
      scope.pagination.numPages = if scope.articles? then Math.ceil(scope.articles.length/scope.pagination.perPage) else scope.pagination.numPages
      return
    , true

    scope.$watch "pagination", ->
      scope.pageStart = scope.pagination.page*scope.perPage
      scope.currentPage = scope.pagination.page * scope.pagination.perPage
      _updatePaginationWindowLimits((scope))
      return
    , true

  link = (scope, element, attrs) ->

    scope = _.extend scope, _composePaginationSettings(scope)

    scope.articlesFilterObject = _composeFilterObject(scope.filters)

    scope.mobileStop = scope.pagination.perPage

    scope.paginationUpperWindowLimit = 0
    scope.paginationLowerWindowLimit = 3
    scope.filteredList = []

    scope.parseDate = (date) ->
      Date.parse(date)

    scope.loadMore = ->
      scope.pagination.nextPage() #do we need this?
      scope.mobileStop = parseInt(scope.mobileStop, 10) + parseInt(scope.pagination.perPage, 10)
      scope.filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.isAtPaginationEnd = (scope.mobileStop >= scope.filteredList.length)
      return

    _setupWatchers(scope)

    scope.isInPageRange = (n) ->
      thisPage = parseInt(n, 10)
      currentPage = scope.pagination.page
      upToPage = currentPage + 2
      if thisPage in [scope.paginationLowerWindowLimit..scope.paginationUpperWindowLimit] then true else false

    return

  result =
    restrict: "EA"
    transclude: true
    replace: true
    templateUrl: "/templates/paginated_article_list.html"
    link: link
    scope:
      perPage: "@"
      articles: "="
      filters: "="
  result
]

# Paginated Press List
sfDirectives.directive "paginatedPressList", ["$filter", "Pagination", ($filter, Pagination) ->

  _composeFilterObject = (filters) ->
    labels = _.pluck(filters, 'label')
    filterObject = {}
    filterObject[l] = "" for l in labels
    filterObject

  _composePaginationSettings = (scope) ->
    pagination = Pagination.getNew(scope.perPage)
    pagination.numPages = 0
    pageConfig = _.extend {pagination}, {
      isAtPaginationEnd: false
      currentPage: 0
      pageStart: 0
    }
    return pageConfig

  _updatePaginationWindowLimits = (scope) ->
    scope.paginationUpperWindowLimit = scope.pagination.upperWindowLimit()
    scope.paginationLowerWindowLimit = scope.pagination.lowerWindowLimit()

  _setupWatchers = (scope) ->

    scope.$watch "articlesFilterObject", ->
      scope.filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.pagination.numPages = Math.ceil(scope.filteredList.length/scope.pagination.perPage)
      scope.isAtPaginationEnd = (scope.mobileStop >= scope.filteredList.length)
      scope.showPaginator = if scope.filteredList.length == 0
        false
      else
        scope.articles.length > scope.pagination.perPage
      return
    , true

    scope.$watch "articles", ->
      scope.pagination.numPages = if scope.articles? then Math.ceil(scope.articles.length/scope.pagination.perPage) else scope.pagination.numPages
      return
    , true

    scope.$watch "pagination", ->
      scope.pageStart = scope.pagination.page*scope.perPage
      scope.currentPage = scope.pagination.page * scope.pagination.perPage
      _updatePaginationWindowLimits((scope))
      return
    , true

  link = (scope, element, attrs) ->

    scope = _.extend scope, _composePaginationSettings(scope)

    scope.articlesFilterObject = _composeFilterObject(scope.filters)

    scope.mobileStop = scope.pagination.perPage

    scope.paginationUpperWindowLimit = 0
    scope.paginationLowerWindowLimit = 3
    scope.filteredList = []

    scope.parseDate = (date) ->
      Date.parse(date)

    scope.loadMore = ->
      scope.pagination.nextPage() #do we need this?
      scope.mobileStop = parseInt(scope.mobileStop, 10) + parseInt(scope.pagination.perPage, 10)
      scope.filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.isAtPaginationEnd = (scope.mobileStop >= scope.filteredList.length)
      return

    _setupWatchers(scope)

    scope.isInPageRange = (n) ->
      thisPage = parseInt(n, 10)
      currentPage = scope.pagination.page
      upToPage = currentPage + 2
      if thisPage in [scope.paginationLowerWindowLimit..scope.paginationUpperWindowLimit] then true else false

    return

  result =
    restrict: "EA"
    transclude: true
    replace: true
    templateUrl: "/templates/paginated_press_list.html"
    link: link
    scope:
      perPage: "@"
      articles: "="
      filters: "="
  result
]

sfDirectives.factory("Pagination", ->
  pagination = {}
  pagination.getNew = (perPage) ->
    perPage ?= 5
    paginator =
      numPages: 1
      perPage: perPage
      page: 0
      windowSize: 3

    paginator.prevPage = ->
      paginator.page -= 1  if paginator.page > 0

    paginator.nextPage = ->
      paginator.page += 1  if paginator.page < paginator.numPages - 1

    paginator.toPageId = (id) ->
      paginator.page = id  if id >= 0 and id <= paginator.numPages - 1

    paginator.upperWindowLimit = ->
      if paginator.page == 0
        2
      else
        paginator.page + 1

    paginator.lowerWindowLimit = ->
      if paginator.page <= 1
        0
      else if paginator.page == paginator.numPages-1
        paginator.page-(paginator.windowSize-1)
      else
        paginator.page - 1

    paginator

  pagination
)

sfDirectives.directive "panelTab", [->
  link = (scope, element, attrs) ->
    scope.hasVideo = ->
      scope.featured?.video_link_url?.length > 0

    scope.displayInModalIfVideo = ->
      scope.$emit('modal:show', scope.featured.video_link_url)

    scope.showActionLink = ->
      scope.featured?.panel_call_to_action_link_url?.length > 0

  restrict: "EA"
  templateUrl: "/templates/panel_tab.html"
  replace: true
  link: link
  scope: {
    featured: "="
  }
]

# Region Dropdown

sfDirectives.directive "regionDropdown", [ ->

  link = (scope, element, attrs) ->
    scope.isActive = false
    scope.countryDropdownIsActive = false
    scope.yearDropdownIsActive = false
    scope.currentRegion = {region:""}
    scope.currentRegionLabel = "REGIONS"
    scope.currentCountryLabel = "COUNTRIES"
    scope.currentYearLabel = scope.yearsCollection[0].name

    scope.chooseRegion = (region) ->
      scope.currentRegion = region
      scope.filterObject.region = region.region
      scope.filterObject.country = ''
      scope.currentRegionLabel = if scope.currentRegion.region.length > 0 then scope.currentRegion.region else "REGIONS"
      scope.countryDropdownIsActive = false
      scope.currentCountryLabel = "COUNTRIES"

    scope.chooseCountry = (country) ->
      scope.filterObject.country = country
      scope.currentCountryLabel = country

    scope.chooseYear = (year) ->
      scope.filterObject.year = year.value
      scope.currentYearLabel = year.name

    scope.hasSelectedRegion = ->
      scope.currentRegion.region.length and scope.currentRegion.region != "USA"

  result =
    restrict: "EA"
    transclude: true
    replace: true
    templateUrl: "/templates/region_dropdown.html"
    link: link
    scope:
      regionsCollection: "="
      yearsCollection: "="
      filterObject: "="
  result
]

# <a scroll-to-position="element-id">
sfDirectives.directive "scrollToPosition", [->
  restrict: "A"
  link: (scope, element, attrs) ->
    idToScrollTo = attrs.scrollToPosition
    element.on "click", ->
      $("body").animate
        scrollTop: $("##{idToScrollTo}").offset().top
      , "slow"
  scope: {}
]

# Slide directive format:
# <slide
#  image-url=""
#  video-url=""
#  link-url=""
#  link-text=""
#  headline=""
#  body-copy=""
#  thumblist="true"
#  date=""
#  blog-category=""
#  quote=""
#  background-color=""
#  logo-image-url=""
#  link-style=""
#  detail-page=""
# ></slide>

sfDirectives.directive "slide", [ ->

  link = (scope, element, attrs) ->
    scope.detailPage ?= ""
    scope.imageUrl ?= ""
    scope.videoUrl ?= ""
    scope.linkUrl ?= ""
    scope.linkText ?= ""
    scope.headline ?= ""
    scope.bodyCopy ?= ""
    scope.thumblist ?= "false"
    scope.date ?= ""
    scope.blogCategory ?= ""
    scope.quote ?= ""
    scope.backgroundColor ?= ""
    scope.logoImageUrl ?= ""
    scope.linkStyle ?= ""
    scope.layout ?= ""
    scope.subhead ?= ""

    scope.youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

    scope.hasSidePanel = ->
      scope.layout?.length > 0 and scope.layout is "side-panel"

    scope.youtubeId = ->
      if scope.videoUrl.match(scope.youtubePattern)?
        scope.videoUrl.match(scope.youtubePattern)[1]
      else
        ""

    scope.hasVideo = ->
      scope.videoUrl?.length > 0

    scope.hasBlogCategory = ->
      scope.blogCategory?.length > 0

    scope.hasDate = ->
      scope.date?.length > 0

    scope.hasDetailPage = ->
      scope.detailPage?.length > 0 and scope.detailPage is "true"

    scope.hasLinkText = ->
      scope.linkText?.length > 0

    scope.hasLinkStyle = ->
      scope.linkStyle?.length > 0

    scope.hasQuote = ->
      scope.quote?.length > 0

    scope.hasHeadline = ->
      scope.headline?.length > 0

    scope.hasBodyCopy = ->
      scope.bodyCopy?.length > 0

    scope.hasLogoImageUrl = ->
      scope.logoImageUrl?.length > 0

    scope.isThumblist = ->
      scope.thumblist?.length > 0 and scope.thumblist is "true"

    scope.hasSubhead = ->
      scope.subhead?.length > 0

    scope.getYoutubeVideoThumbnail = ->
      if scope.hasVideo() and scope.youtubeId()?.length > 0
        "http://img.youtube.com/vi/#{scope.youtubeId()}/1.jpg"

    scope.getImage = ->
      # Use imageUrl, and fall back to videoUrl thumb otherwise
      scope.imageUrl or scope.getYoutubeVideoThumbnail()

    scope.backgroundImageStyle = if scope.hasQuote()
      {
        'background': scope.backgroundColor
      }
    else
      {
        'background-image': 'url(' + scope.getImage() + ')'
      }

    scope.actionLinkStyle = ->
      if scope.isThumblist()
        "call-to-action #{scope.linkStyle}"
      else if scope.hasVideo()
        "action-link video-link #{scope.linkStyle}"
      else if scope.hasLinkText() && !scope.hasDetailPage()
        "action-link text-link #{scope.linkStyle}"
      else
        "action-link #{scope.linkStyle}"

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        scope.$emit('modal:show', scope.videoUrl)

  controller = ($scope, $element) ->
  result =
    restrict: "EA"
    controller: controller
    replace: true
    templateUrl: (elem, attr) ->
      if attr.thumblist? and attr.thumblist is "true"
        "/templates/thumb_slide.html"
      else
        "/templates/swipe_slide.html"
    link: link
    scope:
      backgroundColor: "@"
      blogCategory: "@"
      bodyCopy: "@"
      date: "@"
      detailPage: "@"
      headline: "@"
      imageUrl: "@"
      layout: "@"
      linkStyle: "@"
      linkText: "@"
      linkUrl: "@"
      logoImageUrl: "@"
      quote: "@"
      subhead: "@"
      thumblist: "@"
      videoUrl: "@"
  result

]


# Swiper format:
# <swiper
#   continuous="true"
#   speed="2000"
#   identifier="swiper_1"
#   auto="8000"
#   size="short" also: "tall narrow"
#   paginator="true"
#   slides=""
# >

sfDirectives.directive "swiper", ["$timeout", ($timeout) ->
  link = (scope, element, attrs) ->
    scope.size ?= "tall"
    # There has to be a better way
    scope.childSlides = element.children().eq(2).children().eq(0).children()
    config = {}
    config.auto = if attrs.auto?.length > 0 then attrs.auto else false
    config.speed = parseInt(attrs.speed, 10) or 500
    config.disableScroll = !!attrs.disableScroll if attrs.disableScroll
    config.continuous = !!attrs.continuous if attrs.continuous

    $timeout (->
      scope.swipe = new Swipe(document.getElementById(scope.identifier),
        auto: config.auto
        speed: config.speed
        disableScroll: config.disableScroll
        continuous: config.continuous
        startSlide: 0
        callback: (pos) ->
          scope.setAsCurrent(scope.swipeControls[pos])
      )
    ), 1000

    scope.showPaginator = ->
      scope.paginator? and scope.paginator is "true"

    scope.hasSize = ->
      scope.size? and scope.size.length > 0

    scope.addSize = ->
      sizeClass = scope.size if scope.hasSize
      sizeClass

    # TODO: Take out duplicate function
    scope.setAsCurrent = (selectedSwipeControl) ->
      angular.forEach scope.swipeControls, (swipeControl) ->
        swipeControl.safeApply ->
          swipeControl.toggleActiveState(selectedSwipeControl is swipeControl)
        return
      return

    element.parent().addClass("no-container") if element.parent()?.is("p")

    return

  controller = ($scope, $element) ->
    $scope.next = ->
      $scope.swipe.next()

    $scope.prev = ->
      $scope.swipe.prev()

    $scope.slide = (index) ->
      $scope.swipe.slide index

    $scope.stop = ->
      $scope.swipe.stop()

    $scope.swipeControls = []

    @setAsCurrent = (selectedSwipeControl, pos) ->
      angular.forEach $scope.swipeControls, (swipeControl) ->
        if selectedSwipeControl is swipeControl
          swipeControl.isCurrent = true
          $scope.slide(pos)
          $scope.swipe.stop()
        else
          swipeControl.isCurrent = false
        return
      return

    @addSwipeControl = (swipeControl) ->
      $scope.swipeControls.push swipeControl
      return
    return

  restrict: "EA"
  controller: controller
  link: link
  templateUrl: "/templates/swipe.html"
  transclude: true
  replace: true
  scope:
    identifier: "@"
    paginator: "@"
    size: "@"
]

# <swipe-paginator position="0"></swipe-paginator>
sfDirectives.directive "swipePaginator", [ "$compile", ($compile )->
  link = (scope, element, attrs, swiperController) ->
    scope.isCurrent = scope.position is "0"
    swiperController.addSwipeControl scope
    scope.toggle = (pos) ->
      swiperController.setAsCurrent scope, pos
      return

    scope.toggleActiveState = (flag) ->
      scope.isCurrent = flag

    scope.safeApply = (fn) ->
      phase = @$root.$$phase
      if phase is "$apply" or phase is "$digest"
        fn()  if fn and (typeof (fn) is "function")
      else
        @$apply fn
      return

  restrict: "EA"
  template: """
    <li ng-click="toggle(position)" ng-class="{on:isCurrent==true}"></li>
    """
  transclude: true
  replace: true
  require: "^?swiper"
  link: link
  scope:
    position: "@"
]

#  Tabbed Nav
# <tabbed-nav
#   tab-class="two-tabs"
#   tabs="{{galaTabs}}"
# ></tabbed-nav>
sfDirectives.directive "tabbedNav", ["$location", ($location) ->

  link = (scope, element, attrs) ->
    scope.location = $location

  restrict: "EA"
  link: link
  templateUrl: "/templates/tabbed_nav.html"
  transclude: true
  replace: true
  scope:
    tabClass: "@"
    tabs: "="
]

# <thumblist-nav full="true"></thumblist-nav>

sfDirectives.directive "thumblistNav", [ "$timeout", "$window", ($timeout, $window) ->

  _initScrollPane = (scope, element) ->
    $timeout( ->
      scope.pane = angular.element('.thumblist-nav').jScrollPane()
      scope.api = scope.pane.data().jsp
      return
    , 400)

  link = (scope, element, attrs) ->
    scope.config = showArrows: false
    _initScrollPane(scope, element)

    scope.$watch (->
      element.find(".slide").length
    ), (length) ->
      $timeout( ->
        scope.api.reinitialise() if scope.api?
        return
      , 400)

    scope.$on("window.resized", (event, args) ->
      angular.element('.thumblist-nav').jScrollPane().data().jsp.destroy()
      _initScrollPane(scope, element)
    )

    scope.isFullHeight = ->
      scope.full?.length > 0 and scope.full is "true"

    scope.thumbClasses = ->
      if scope.isFullHeight()
        "full thumblist thumblist-nav horizontal-only"
      else
        "thumblist thumblist-nav horizontal-only"

    # So thumblist stretches full-width
    element.parent().addClass("no-container") if element.parent()?.is("p")

  template = """
    <div ng-class="thumbClasses()" ng-transclude></div>
    """
  restrict: "EA"
  link: link
  template: template
  transclude: true
  replace: true
  scope:
    full: "@"
]

# <video-player-modal show='modalVideo' width='90%' height='90%'>
#   <p>Modal Content Goes here<p>
#   <iframe
#     width="853"
#     height="480"
#     src="{{modalVideo}}"
#     frameborder="0"
#     allowfullscreen>
#   </iframe>
# </video-player-modal>

sfDirectives.directive 'videoPlayerModal', [ ->
  restrict: "EA"
  scope: {
    videoIframe: "="
  }
  replace: true
  transclude: true
  link: (scope, element, attrs) ->
    scope.dialogStyle = {}
    scope.dialogStyle.width = attrs.width  if attrs.width
    scope.dialogStyle.height = attrs.height  if attrs.height

    scope.playerDiv = angular.element(element.find("div")[3])
    scope.bodyDiv = document.getElementsByTagName("body")[0]
    scope.iframeContent = ""

    scope.hideModal = ->
      scope.videoIframe = false
      scope.$emit('modal:hide')

    scope.$watch('videoIframe', (newVal, oldVal) ->
      if newVal && !oldVal
        scope.iframeContent = newVal.replace(/(?:http(?:s?):\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/g, '<iframe width="1280" height="720" style="max-width:100%;max-height:100%;" src="http://www.youtube.com/embed/$1?autoplay=1" frameborder="0" allowfullscreen></iframe>')
        scope.bodyDiv.style.overflow = "hidden";
      else
        scope.bodyDiv.style.overflow = ""
        scope.iframeContent = ""
    )

  templateUrl: "/templates/video_player_modal.html"
]

sfDirectives.directive "worldMap", ["$timeout", ($timeout) ->
  restrict: "EA"
  templateUrl: "/templates/world_map.html"
  transclude: true
  replace: true
  scope:
    markers: "="
  link: (scope, element, attrs) ->

    createImagePattern = (id, url) ->
      # Set namespace for SVG elements.
      svgMap      = angular.element('.jvectormap-container > svg').get(0);
      svgNS       = 'http://www.w3.org/2000/svg';
      svgNSXLink  = 'http://www.w3.org/1999/xlink';

      svgMap.setAttribute('xmlns',        svgNS);
      svgMap.setAttribute('xmlns:link',   svgNSXLink);
      svgMap.setAttribute('xmlns:ev',     'http://www.w3.org/2001/xml-events');

      # Create pattern for markers.
      pattern     = document.createElementNS(svgNS, 'pattern');
      pattern.setAttribute('id', id);

      # pattern.setAttribute('patternUnits', 'userSpaceOnUse');
      pattern.setAttribute('width',       '30');
      pattern.setAttribute('height',      '30');

      # Create image for pattern.
      image       = document.createElementNS(svgNS, 'image');
      image.setAttribute('x',             '0');
      image.setAttribute('y',             '0');
      image.setAttribute('width',         '24');
      image.setAttribute('height',        '24');
      image.setAttributeNS(svgNSXLink, 'xlink:href', url);

      # Put it together
      svgMap.appendChild(pattern);
      pattern.appendChild(image);
      undefined

    generateMap = (markers) ->
      markerList = if (markers?) then markers else {"coords" : [], "icons" : []}

      wolrd_map = angular.element("#world-map-gdp")
      wolrd_map.vectorMap
        map: "world_mill_en"
        markers: markerList.coords
        markersSelectableOne: true
        zoomOnScroll: false
        markerStyle:
          initial:
            "stroke-width": 0
            "stroke-opacity": 0
            r: 12
          hover:
            stroke: "#1b74a4"
            "stroke-opacity": 1
            "stroke-width": 2
        backgroundColor: "#329FD6"
        onMarkerClick: (event, index) =>
          rootScope = angular.element('body').scope()
          content = markerList.meta_data[index]
          $popup = $('#map-popup')
          $popup.css
            left: "#{window.innerWidth/2}px"
          bodyDiv = document.getElementsByTagName("body")[0]

          # Define HTML templates.
          ctaTpl = if content.action_text
            if content.marker_type is "video" then "<p class='centered'><a class='view-more'>#{content.action_text}</a></p>"
            else "<p class='centered'><a class='read-more' href='#{content.action_target}' target='_blank'>#{content.action_text}</a></p>"
          else ""

          popupTpl = "
            <span class='close-popup'>X</span>
            <img src='#{content.thumbnail_url}' />
            <a class='play-video-link #{content.marker_type}'>&nbsp;</a>
            <div class='background-popup'>
              <div class='text-popup-container'>
                <div class='text-popup'>
                  <h2>#{content.title}</h2>
                  <span class='location'>#{content.location}</span>
                  <p>#{content.text}</p>
                  #{ctaTpl}
                </div>
              </div>
            </div>
          "
          $popup
            .removeClass('visible')
            .empty()
            .fadeIn("slow", ->
              $timeout( ->
                $popup
                  .html(popupTpl)
                  .addClass('visible')
                  .find('.text-popup')
                  .jScrollPane()
              , 200)
            )

          $("html, body").animate
            scrollTop: $("#world-map-gdp").offset().top - 88
          , "slow"

          $popup.on 'click', '.close-popup', ->
            $popup
              .fadeOut()
              .find('.text-popup')
              .jScrollPane().data().jsp.destroy()
            bodyDiv.style.overflow = ""

          $popup.on 'click', '.play-video-link, .view-more',  ->
            rootScope.directModalTrigger(content.action_target)

      for icon in markerList.icons
        createImagePattern(icon.id, icon.path)

      return

    resizeMap = () ->
      jvectormap = angular.element("#world-map-gdp").vectorMap("get", "mapObject")
      jvectormap.setSize()
      return

    scope.$on('showmap', ->
      $timeout(resizeMap, 200)
      return
    )

    scope.$watch('markers', ->
      scope.markers.getIndex().then (data) ->
        generateMap(data)
        return
    , true)

    return
]

$ ->
  $(document).on 'mouseenter', '#map-popup .text-popup-container', ->
    $('body').css('overflow', 'hidden')

  $(document).on 'mouseleave', '#map-popup .text-popup-container', ->
    $('body').css('overflow', 'auto')


# Directive that prevents submit if there are still form errors
sfDirectives.directive "validSubmit", ["$parse", "$http", "$rootScope", ($parse, $http, $rootScope) ->
  require: "form"

  link: (scope, element, attr, form) ->
    form.$submitted = false

    # Register DOM event handler and wire into Angular's lifecycle
    # with scope.$apply
    element.on "submit", (event) ->
      scope.$apply ->
        form.$submitted = true
        if form.$valid
          $http
            method: 'POST'
            url: attr.action
            data: element.serialize()
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
              'X_REQUESTED_WITH' : 'XMLHttpRequest'
            }
          .success (data, status, headers, config) ->
            angular.element("input[name=xid]").val(headers('X-EEXID'))
            $rootScope.showThanks = true
            scope.showSubscribeForm = false
            scope.showForm = false
            return

          form.$submitted = false

        event.preventDefault()
        return

      return

    return
]
