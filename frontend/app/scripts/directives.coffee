sfDirectives = angular.module("sfDirectives", ["ngSanitize", "sfFilters"])

# open external links in new window
sfDirectives.directive 'href', ["$location", ($location) ->
  compile: (element) ->
    if element.prop("tagName") is 'A'
      url = element.attr('href')

      # Check if external domain
      match = url.match(/^([^:\/?#]+:)?(?:\/\/([^\/?#]*))?([^?#]+)?(\?[^#]*)?(#.*)?/)
      if typeof match[2] is "string" and match[2].length > 0 and match[2].toLowerCase() isnt $location.host()
        element.attr('target', '_blank')

      # Check if file link
      match = url.match(/\.[0-9a-z]+$/)
      if typeof match is "string" and match.length > 0 and match.toLowerCase() isnt '.html'
        element.attr('target', '_blank')
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
  restrict: "E"
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
  restrict: "E"
  replace: true
  transclude: true
  template: template
  link: link
  scope:
    title: "@"
    subhead: "@"
]

# Detail page directive format
# <detail-page
#   detail-page-type="blog"
#   date="{entry_date format='%M %d, %Y'}"
#   author="{blog_author}"
#   category="{blog_category}"
#   title="{title}"
#   subhead=""
#   body="{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}"
#   header-image-url="{blog_image}"
#   thumbnail-image-url=""
#   previous-page-id=""
#   next-page-id=""
#   share-this="false"
#   has-related-posts="false">
# </detail-page>
sfDirectives.directive "detailPage", [ "$timeout", "$compile", ($timeout, $compile)->

  link = (scope, element, attrs) ->
    scope.author ?= ""
    scope.body ?= ""
    scope.category ?= ""
    scope.date ?= ""
    scope.detailPageType ?= ""
    scope.hasRelatedPosts ?= ""
    scope.headerImageUrl ?= ""
    scope.previousPageId ?= ""
    scope.nextPageId ?= ""
    scope.shareThis ?= ""
    scope.subhead ?= ""
    scope.thumbnailImageUrl ?= ""
    scope.title ?= ""

  result =
    restrict: "E"
    replace: true
    templateUrl: ->
      # TODO - template chooser
      "templates/blog_detail_page.html"
    link: link
    # priority: 1
    scope:
      author: "@"
      body: "@"
      category: "@"
      date: "@"
      detailPageType: "@"
      hasRelatedPosts: "@"
      headerImageUrl: "@"
      previousPageId: "@"
      nextPageId: "@"
      shareThis: "@"
      subhead: "@"
      thumbnailImageUrl: "@"
      title: "@"
  result
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
    restrict: "E"
    transclude: true
    replace: true
    controller: controller
    template: """
      <div class="outer-dropdown-wrapper">
        <div class="dropdown-wrapper" ng-click="isActive=!isActive" ng-class="{active: isActive==true}">
          <span >{{currentOption.name}}</span>
          <ul class="dropdown-list" ng-show="isActive==true">
            <dropdown-option ng-repeat="option in options" name="{{option.name}}" value="{{option.value}}"></dropdown-option>
          </ul>
        </div>
      </div>
      """
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
  template = """
    <div>
      <a class="title" href ng-click="toggle()" ng-class="{active: showMe==true}">{{title}} <span class="arrow">&gt;</span></a>
      <div class="body reveal" ng-show="showMe" ng-transclude>
      </div>
    </div>
    """
  restrict: "EA"
  replace: true
  transclude: true
  require: "^?accordion"
  # link: link
  template: template
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
      template: """
        <section class="facebook-fans centered">
          <div class="footer-list-item">
            <h1>{{shares}} <strong>fans</strong></h1>
          </div>
          <p class="read-more">
            <a href="http://www.facebook.com/sharer.php?u=http://starkeyhearingfoundation.org" target="_blank">
              Like us
              <span class="facebook-like-hand"></span>
            </a>
          </p>
        </section>
        """
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

  link = (scope, element, attrs) ->
    $timeout( ->
      scope.pane = $('.thumblist-nav')
      scope.pane.jScrollPane(config)
      scope.api = element.data("jsp")
      return
    , 1400)

    scope.$on("window.resized", (event, args) ->
      $timeout( ->
        if scope.api?
          scope.api.reinitialise()
          return
      , 400)
    )

  controller = ($scope, $element) ->
    $scope.getItem = (url)->
      $http.get("/api/gala_item/#{url}").then (response) ->
        # $http.get("/local/api/gala_item").then (response) ->
        $scope.rawHtml = response.data

  controller: controller
  restrict: "E"
  link: link
  templateUrl: "templates/gala_thumblist_nav.html"
  replace: true
  scope:
    items: "="
]

# <gallery></gallery>

sfDirectives.directive "gallery", [ "$timeout", ($timeout) ->

  link = (scope, element, attrs) ->
    scope.slides ?= 1

    scope.isThumblist = ->
      scope.slides > 1

    config = { showArrows: true}

    scope.isFullHeight = ->
      scope.full?.length > 0 and scope.full is "true"

    scope.galleryClasses = ->
      if scope.isThumblist()
        "gallery full thumblist thumblist-nav horizontal-only"
      else
        "single-image-gallery"

    # So thumblist stretches full-width
    element.parent().addClass("no-container") if element.parent()?.is("p")

    if scope.isThumblist()
      element.jScrollPane config
      scope.api = element.data("jsp")
      scope.$watch (->
        element.find(".gallery-slide").length
      ), (length) ->
        $timeout( ->
          if scope.api?
            scope.api.reinitialise()
          return
        , 800)

      scope.$on("window.resized", (event, args) ->
        $timeout( ->
          if scope.api?
            scope.api.reinitialise()
        , 400)
      )

  template = """
    <div ng-class="galleryClasses()" ng-transclude></div>
    """
  restrict: "E"
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
      if scope.hasVideo()
        "links_to_video"
      else
        "plain_image"

    scope.backgroundImageStyle =
      {
        'background-image': 'url(' + scope.getImage() + ')'
        'background-size': 'cover'
      }

    scope.imageStyle =
      {
        'width': '530px'
      }

  result =
    restrict: "E"
    replace: true
    templateUrl:
      "templates/gallery_slide.html"
    link: link
    scope:
      imageUrl: "@"
      videoUrl: "@"
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

  link = (scope, element, attrs) ->
    config = { showArrows: false }

    setTimeout( ->
      scope.pane = $('.thumblist-nav')
      scope.pane.jScrollPane(config)
      scope.api = scope.pane.data("jsp")
    , 1400)

    scope.$on("window.resized", (event, args) ->
      $timeout( ->
        scope.api.reinitialise()
      , 400)
    )

  restrict: "E"
  link: link
  templateUrl: "templates/home_thumblist_nav.html"
  replace: true
  scope:
    featured: "="
    clickaction: "="

]

sfDirectives.directive("instagramGallery", [
  "$http"
  "Instagram"
  ($http, Instagram) ->
    return {
      restrict: "E"
      scope: {}
      replace: true
      template: """
        <ul class='thumbs'>
          <li ng-repeat="p in pics">
            <a href="{{p.link}}" target="_blank" ng-style="{'background-image': 'url(' + p.images.thumbnail.url + ')'}">&nbsp;</a>
          </li>
        </ul>

        """
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
      restrict: "E"
      scope: {}
      replace: true
      template: """
        <section>
          <div class="footer-list-item">
            <h4>From our blog</h4>
            <p>{{article.title}}</p>
            <p class="align-right">{{article.date}}</p>
          </div>
          <p class="read-more"><a href="/blog#articles/{{article.id}}">Check out our blog &rarr;</a></p>
        </section>
        """
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

    scope.worldMapConfig = _.extend({map: "world_mill_en"}, scope.mapConfig)
    scope.usMapConfig = _.extend({map: "us_aea_en"}, scope.mapConfig)

    scope.selectTopLevelList = (continent) ->
      scope.selectedList = continent
      scope.greetingFlag = true

    scope.initializeMaps = ->
      $timeout( ->
        $("#missions-world-map").vectorMap(scope.worldMapConfig)

        scope.worldMapObject = $("#missions-world-map").vectorMap("get", "mapObject")

        $("#missions-us-map").vectorMap(scope.usMapConfig)

        scope.usMapObject = $("#missions-us-map").vectorMap("get", "mapObject")
      , 1800)

    scope.hasContinentAndCountry = ->
      scope.hasContinent() or scope.hasCountry()

    scope.hasContinent = ->
      scope.currentContinent?.name?

    scope.hasCountry = ->
      scope.currentCountry?.name?

    scope.countryClass = (name) ->
      if name?.length
        if name is "US"
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
        mapObj.setFocus countryCodes, .2
        mapObj.setSelectedRegions countryCodes

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

    scope.initializeMaps()

  controller = ($scope, $element) ->

    $scope.showContinent = (continent) ->
      if continent.name is "US"
        $scope.bringUSMapToFront(true, continent)

      else
        $scope.bringUSMapToFront(false, continent)

    $scope.showCountry = (country, continent) ->
      countryCode = country.abbreviation
      if countryCode?.length > 0 and country.total_hearing_aids_provided?.length > 0
        if continent.name is "US"
          $scope.bringUSMapToFront(true, continent)
          $scope.highlightCountryRegion(country, $scope.usMapObject)
        else
          $scope.bringUSMapToFront(false, continent)
          $scope.highlightCountryRegion(country, $scope.worldMapObject)

  restrict: "E"
  link: link
  controller: controller
  templateUrl: "templates/missions_map.html"
  replace: true
  scope:
    data: "="
]

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
    templateUrl: "templates/page_tile.html"
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

  _setupWatchers = (scope) ->

    scope.$watch "articlesFilterObject", ->
      filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.pagination.numPages = Math.ceil(filteredList.length/scope.pagination.perPage)
      scope.isAtPaginationEnd = (scope.mobileStop >= filteredList.length)
      return
    , true

    scope.$watch "articles", ->
      scope.pagination.numPages = if scope.articles? then Math.ceil(scope.articles.length/scope.pagination.perPage) else scope.pagination.numPages
      return
    , true

    scope.$watch "pagination", ->
      scope.pageStart = scope.pagination.page
      scope.currentPage = scope.pagination.page * scope.pagination.perPage
      return
    , true

  link = (scope, element, attrs) ->

    scope = _.extend scope, _composePaginationSettings(scope)

    scope.articlesFilterObject = _composeFilterObject(scope.filters)

    scope.mobileStop = scope.pagination.perPage

    scope.parseDate = (date) ->
      Date.parse(date)

    scope.loadMore = ->
      scope.pagination.nextPage() #do we need this?
      scope.mobileStop = parseInt(scope.mobileStop, 10) + parseInt(scope.pagination.perPage, 10)
      filteredList = $filter('filter')(scope.articles, scope.articlesFilterObject)
      scope.isAtPaginationEnd = (scope.mobileStop >= filteredList.length)
      return

    _setupWatchers(scope)

    scope.isInPageRange = (n) ->
      thisPage = parseInt(n, 10)
      currentPage = scope.pagination.page
      upToPage = currentPage + 2
      if thisPage in [currentPage..upToPage] then true else false
    return

  result =
    restrict: "E"
    transclude: true
    replace: true
    templateUrl: "templates/paginated_article_list.html"
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
    perPage = (if perPage is `undefined` then 5 else perPage)
    paginator =
      numPages: 1
      perPage: perPage
      page: 0

    paginator.prevPage = ->
      paginator.page -= 1  if paginator.page > 0

    paginator.nextPage = ->
      paginator.page += 1  if paginator.page < paginator.numPages - 1

    paginator.toPageId = (id) ->
      paginator.page = id  if id >= 0 and id <= paginator.numPages - 1

    paginator

  pagination
)

sfDirectives.directive "panelTab", [->
  link = (scope,element, attrs) ->
    scope.hasVideo = ->
      scope.featured?.video_link_url?

    scope.displayInModalIfVideo = ->
      scope.$emit('modal:show', scope.featured.video_link_url)

    scope.showActionLink = ->
      scope.featured?.panel_call_to_action_link_url?.length > 0

  restrict: "E"
  templateUrl: "templates/panel_tab.html"
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
      scope.currentRegion.region.length >0

  result =
    restrict: "E"
    transclude: true
    replace: true
    template: """
      <ul class="articles-filters desktop">
        <li><strong>Sort</strong></li>
        <li class="filters-devider">|</li>
        <li class="dropdown desktop">
          <div class="outer-dropdown-wrapper">
            <div class="dropdown-wrapper" ng-click="yearDropdownIsActive=!yearDropdownIsActive" ng-class="{active: yearDropdownIsActive==true}">
              <span>{{currentYearLabel}}</span>
              <ul class="dropdown-list">
                <li ng-repeat="year in yearsCollection"><a href ng-click="chooseYear(year)">{{year.name}}</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="filters-devider">|</li>
        <li class="dropdown desktop">
          <div class="outer-dropdown-wrapper">
            <div class="dropdown-wrapper" ng-click="isActive=!isActive" ng-class="{active: isActive==true}">
              <span>{{currentRegionLabel}}</span>
              <ul class="dropdown-list">
                <li><a href ng-click="chooseRegion({region:'',countries:[]})">REGIONS</a></li>
                <li ng-repeat="region in regionsCollection"><a href ng-click="chooseRegion(region)">{{region.region}}</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li ng-show="hasSelectedRegion()" class="filters-devider">|</li>
        <li class="dropdown desktop">
          <div class="outer-dropdown-wrapper" ng-show="hasSelectedRegion()">
            <div class="dropdown-wrapper" ng-click="countryDropdownIsActive=!countryDropdownIsActive" ng-class="{active: countryDropdownIsActive==true}">
              <span>{{currentCountryLabel}}</span>
              <ul class="dropdown-list">
                <li ng-click="chooseCountry('')">Countries</li>
                <li ng-repeat="country in currentRegion.countries"><a href ng-click="chooseCountry(country)">{{country}}</a></li>
              </ul>
            </div>
          </div>
        </li>
      </ul>
      """
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
      else
        "action-link #{scope.linkStyle}"

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        scope.$emit('modal:show', scope.videoUrl)

  controller = ($scope, $element) ->
  result =
    restrict: "E"
    controller: controller
    replace: true
    templateUrl: (elem, attr) ->
      if attr.thumblist? and attr.thumblist is "true"
        "templates/thumb_slide.html"
      else
        "templates/swipe_slide.html"
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
# >

sfDirectives.directive "swiper", ["$timeout", ($timeout) ->
  link = (scope, element, attrs) ->
    scope.size ?= "tall"
    # There has to be a better way
    scope.childSlides = element.children().eq(2).children().eq(0).children()
    config = undefined
    config = {}
    config.auto = if attrs.auto?.length > 0
      attrs.auto
    else
      false
    config.speed = parseInt(attrs.speed, 10) or 500
    config.disableScroll = !!attrs.disableScroll  if attrs.disableScroll
    config.continuous = !!attrs.continuous  if attrs.continuous

    # TODO Use a promise
    $timeout (->
      scope.swipe = new Swipe(document.getElementById(scope.identifier),
        auto: config.auto
        speed: config.speed
        disableScroll: config.disableScroll
        continuous: config.continuous
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
  templateUrl: "templates/swipe.html"
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
    scope.isCurrent = if scope.position is "0" then true else false
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

  restrict: "E"
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
sfDirectives.directive "tabbedNav", ["$window", ($window) ->

  link = (scope, element, attrs) ->
    scope.currentTab = 0

    scope.navigateTo = (tabIndex) ->
      scope.currentTab = tabIndex
      $window.location.href = scope.tabs[tabIndex].link

  restrict: "E"
  link: link
  templateUrl: "templates/tabbed_nav.html"
  transclude: true
  replace: true
  scope:
    tabClass: "@"
    tabs: "="
]

# <thumblist-nav full="true"></thumblist-nav>

sfDirectives.directive "thumblistNav", [ "$timeout", "$window", ($timeout, $window) ->
  link = (scope, element, attrs) ->
    config = showArrows: false

    $timeout (->
      scope.pane = element
      scope.pane.jScrollPane config
      scope.api = scope.pane.data("jsp")
    ), 400

    scope.$watch (->
      element.find(".slide").length
    ), (length) ->
      $timeout( ->
        if scope.api?
          scope.api.reinitialise()
        return
      , 200)

    scope.$on("window.resized", (event, args) ->
      $timeout( ->
        if scope.api?
          scope.api.reinitialise()
      , 400)
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
  restrict: "E"
  link: link
  template: template
  transclude: true
  replace: true
  scope:
    full: "@"
]

# <button ng-click='toggleModal("http://www.youtube.com/embed/xx2Dx_rRdws")'>Open Modal Dialog</button>

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

# sfDirectives.directive 'videoTrigger', [->
#   restrict: "A"
#   link: (scope, element, attr) ->
#     console.debug "attr", attr
# ]

sfDirectives.directive 'videoPlayerModal', ["$window", ($window) ->
  restrict: "E"
  scope: {
    show: "="
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
      scope.show = false
      scope.$emit('modal:hide')

    scope.$watch('show', (newVal, oldVal) ->
      if newVal && !oldVal
        scope.iframeContent = newVal.replace(/(?:http(?:s?):\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/g, '<iframe width="100%" height="100%" src="http://www.youtube.com/embed/$1?autoplay=1" frameborder="0" allowfullscreen></iframe>')
        scope.bodyDiv.style.overflow = "hidden";
      else
        scope.bodyDiv.style.overflow = ""
        scope.iframeContent = ""
    )

  template: """
    <div class='ng-modal' ng-show='show'>
      <div class='ng-modal-overlay' ng-click='hideModal()'></div>
      <div class='ng-modal-dialog' ng-style='dialogStyle'>
        <div class='ng-modal-close' ng-click='hideModal()'>X</div>
        <div class='ng-modal-dialog-content'>
          <div class="player" ng-bind-html="iframeContent"></div>
        </div>
      </div>
    </div>
    """
]

sfDirectives.directive "worldMap", ["$timeout", ($timeout) ->
  restrict: "E"
  template: "<section class='map'><div id='map-popup'><div class='content'></div></div><div ng-transclude></div><div id='world-map-gdp'></div></section>"
  transclude: true
  replace: true
  scope:
    markers: "="
  link: (scope, element, attrs) ->

    createImagePattern = (id, url) ->
      # Set namespace for SVG elements.
      svgMap      = $('.jvectormap-container > svg').get(0);
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

    generateMap = () ->
      if scope.markers?
       markerList = scope.markers
      else
       markerList =
        "coords" : []
        "icons" : []

      $("#world-map-gdp").vectorMap
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
          content = markerList.meta_data[index]
          $popup = $('#map-popup')
          $popup.fadeOut "slow", ->
            $popup
              .find(".content").empty()
              .html("<span class='close' ng-click='closePopup()'>X</span><img src='#{content.thumbnail_url}'/><div class='background-popup'><div class='text-popup'><h2>#{content.title}</h2><span class='location'>#{content.location}</span></span><p>#{content.text}</p><p class='centered'><a class='read-more' href='#{content.action_target}'>LEARN MORE</a></div></div>")
            $popup
              .fadeIn()
            $popup.find('.close').click ->
              $popup.fadeOut()

      for icon in markerList.icons
        createImagePattern(icon.id, icon.path)

      undefined

    $timeout(generateMap, 1200);
    undefined
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
