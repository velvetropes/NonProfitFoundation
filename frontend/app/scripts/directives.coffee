sfDirectives = angular.module("sfDirectives", ["ngSanitize", "sfFilters"])

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
    # template = if scope.detailPageType is "blog"
    #   blogDetailTemplate
    # else
    #   pressReleaseDetailTemplate
    # element.html(template)
    # $compile(element.contents())(scope)
    # $timeout( ->
    #   element.html(template)
    #   $compile(element.contents())(scope)
    # , 4800)
    # el = $compile('<div class="text-container" ng-bind-html="body"></div>')(scope)

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
        <div class="centered">
          <div>
            <h1>{{shares}} <strong>fans</strong></h1>
          </div>
          <p class="read-more"><a href>Like us</a></p>
        </div>
        """
      link: (scope, element, attr) ->
        scope.shares = 0
        $http.get("https://api.facebook.com/method/links.getStats?urls=" + scope.url + "&format=json").success((res) ->
          scope.shares = res[0].share_count
        ).error ->
          scope.shares = 0

        $timeout ->
          element.bind "click", ->
            FB.ui
              method: "feed"
              name: "Facebook shares"
              link: scope.url
              caption: scope.caption
    }
])

# <gala-thumblist-nav items="timelineItems"></gala-thumblist-nav>

sfDirectives.directive 'galaThumblistNav', ["$http", "$sce", ($http, $sce) ->
  config = {}

  link = (scope, element, attrs) ->
    setTimeout( ->
      scope.pane = $('.thumblist-nav')
      scope.pane.jScrollPane(config)
    , 1400)

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

    if scope.isThumblist()
      $timeout (->
        scope.pane = $(".gallery")
        scope.pane.jScrollPane config
      ), 1400

    scope.isFullHeight = ->
      scope.full?.length > 0 and scope.full is "true"

    scope.galleryClasses = ->
      if scope.isThumblist()
        "gallery" #full thumblist thumblist-nav horizontal-only
      else
        "single-image-gallery"

    # So thumblist stretches full-width
    element.parent().addClass("no-container") if element.parent()?.is("p")

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

sfDirectives.directive "gallerySlide", [ ->

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

sfDirectives.directive 'homeThumblistNav', [->

  link = (scope, element, attrs) ->
    config = { showArrows: false }

    setTimeout( ->
      scope.pane = $('.thumblist-nav')
      scope.pane.jScrollPane(config)
    , 1400)

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
            <a href="{{p.link}}" target="_blank"><img ng-src="{{p.images.thumbnail.url}}" /></a>
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

  restrict: "E"
  templateUrl: "templates/panel_tab.html"
  replace: true
  link: link
  scope: {
    featured: "="
  }
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
        bullets = $("[data-swiper='" + scope.identifier + "'] li")
        bullets.removeClass('on')
        bullets.eq(pos).addClass('on')
      )
    ), 1000

    scope.showPaginator = ->
      scope.paginator? and scope.paginator is "true"

    scope.hasSize = ->
      scope.size? and scope.size.length > 0

    scope.addSize = ->
      sizeClass = scope.size if scope.hasSize
      sizeClass

    element.parent().addClass("no-container") if element.parent()?.is("p")
    slides = element.children(".slide")
  controller = ($scope, $element) ->
    $scope.next = ->
      $scope.swipe.next()

    $scope.prev = ->
      $scope.swipe.prev()

    $scope.slide = (index) ->
      $scope.swipe.slide index

  restrict: "E"
  link: link
  controller: controller
  templateUrl: "templates/swipe.html"
  transclude: true
  replace: true
  # priority: 0
  scope:
    identifier: "@"
    paginator: "@"
    size: "@"
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

sfDirectives.directive "thumblistNav", [ "$timeout", ($timeout) ->
  link = (scope, element, attrs) ->
    config = showArrows: false
    # TODO Use a promise
    $timeout (->
      scope.pane = $(".thumblist-nav")
      scope.pane.jScrollPane config
    ), 1400

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
        scope.iframeContent = newVal.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/g, '<iframe width="100%" height="100%" src="http://www.youtube.com/embed/$1?autoplay=1" frameborder="0" allowfullscreen></iframe>')
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

sfDirectives.directive "worldMap", [->
  link = (scope, element, attrs) ->

    setTimeout( ->
      $("#world-map-gdp").vectorMap
        map: "world_mill_en"
        markers: scope.markers.coords
        markersSelectableOne: true
        zoomOnScroll: false
        series:
          markers: [
            attribute: "fill"
            scale: ["#C8EEFF", "#0071A4"]
          ]

        onMarkerClick: (event, index) =>
          content = scope.markers.meta_data[index]
          $popup = $('#map-popup')
          $popup.fadeOut "slow", ->
            $popup
              .find(".content").empty()
              .html("<span class='close' ng-click='closePopup()'>X</span><img src='#{content.thumbnail_url}'/><div class='background-popup'><div class='text-popup'><h2>#{content.title}</h2><span class='location'>#{content.location}</span></span><p>#{content.text}</p><p class='centered'><a class='read-more' href='#{content.action_target}'>LEARN MORE</a></div></div>")
            $popup
              .fadeIn()
            $popup.find('.close').click ->
              $popup.fadeOut()
      mapObject = $("#world-map-gdp").vectorMap("get", "mapObject")
    , 1800)

  restrict: "E"
  link: link
  template: "<section class='map'><div id='map-popup'><div class='content'></div></div><div ng-transclude></div><div id='world-map-gdp'></div></section>"
  transclude: true
  replace: true
  scope: {
    markers: "="
  }
]
