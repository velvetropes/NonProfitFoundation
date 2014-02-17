sfDirectives = angular.module("sfDirectives", ["ngSanitize", "sfFilters"])

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
              .html("<span class='close'><a href ng-click='closePopup()'>X</a></span><img src='#{content.thumbnail_url}'/><div class='background-popup'><h1>#{content.title}</h1><p>#{content.text}</p></div>")
            $popup
              .fadeIn()
      mapObject = $("#world-map-gdp").vectorMap("get", "mapObject")
    , 1800)

  controller = ($scope, $element) ->
    $scope.closePopup = ->
      $('#map-popup').fadeOut()

  restrict: "E"
  link: link
  controller: controller
  template: "<section class='map'><div id='map-popup'><div class='content'></div></div><div ng-transclude></div><div id='world-map-gdp'></div></section>"
  transclude: true
  replace: true
  scope: {
    markers: "="
  }
]

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

    scope.selectTopLevelList = (continent) ->
      scope.selectedList = continent

    scope.initializeMaps = ->
      $timeout( ->
        $("#missions-world-map").vectorMap
          map: "world_mill_en"
          zoomOnScroll: false
          backgroundColor: "none";
          regionStyle:
            selected:
              fill: "#ffad20"
          focusOn:
            x: 0.5,
            y: 0.5,
            scale: .5

        scope.worldMapObject = $("#missions-world-map").vectorMap("get", "mapObject")

        $("#missions-us-map").vectorMap
          map: "us_aea_en"
          zoomOnScroll: false
          backgroundColor: "none";
          regionStyle:
            selected:
              fill: "#ffad20"
          focusOn:
            x: 0.5,
            y: 0.5,
            scale: .5

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
      if countryCode?.length > 0
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

sfDirectives.directive "panelTab", [->

  restrict: "E"
  templateUrl: "templates/panel_tab.html"
  replace: true
  scope: {
    featured: "="
  }
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
  repalce: true
  scope:
    articles: "="
    clickaction: "="

]

# <thumblist-nav full="true"></thumblist-nav>

sfDirectives.directive "thumblistNav", [ "$timeout", ($timeout) ->
  link = (scope, element, attrs) ->
    config = showArrows: false
    # TODO Use a promise
    $timeout (->
      scope.pane = $(".thumblist-nav")
      scope.pane.jScrollPane config
    ), 2400

    scope.isFullHeight = ->
      scope.full?.length > 0 and scope.full is "true"

    scope.thumbClasses = ->
      if scope.isFullHeight()
        "full thumblist thumblist-nav horizontal-only"
      else
        "thumblist thumblist-nav horizontal-only"

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

# Swiper format:
# <swiper
#   continuous="true"
#   speed="2000"
#   identifier="swiper_1"
#   auto="8000"
#   tall="false"
#   paginator="true"
# >

sfDirectives.directive "swiper", ["$timeout", ($timeout) ->
  link = (scope, element, attrs) ->
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
      scope.swipe = new Swipe(document.getElementById(scope.identifier), config)
    ), 1800

    scope.showPaginator = ->
      scope.paginator? and scope.paginator is "true"

    scope.isShort = ->
      scope.tall? and scope.tall is "false"

    element.parent().addClass("no-container") if element.parent()?.is("p")

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
    tall: "@"
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

    scope.youttubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

    scope.hasSidePanel = ->
      scope.layout?.length > 0 and scope.layout is "side-panel"

    scope.youtubeId = ->
      scope.videoUrl.match(scope.youttubePattern)[1]

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
      if scope.hasVideo()
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
        # 'background-size': 'cover'
      }

    scope.actionLinkStyle = ->
      if scope.isThumblist()
        "call-to-action #{scope.linkStyle}"
      else
        "action-link #{scope.linkStyle}"

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        # Send videoUrl to overlay
        scope.$emit('modal:show', scope.videoUrl)

      # else
      #   # Regular link to external URL
      #   $window.location.href = "#{scope.linkUrl}"

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

    # scope.hasDetailPage = ->
    #   scope.detailPage?.length > 0

    # scope.isPressRelease = ->
    #   scope.type?.length > 0 and scope.type is "Press Release"

    # scope.hasQuote = ->
    #   scope.quote?.length > 0

    # scope.hasHeadline = ->
    #   scope.headline?.length > 0

    # scope.hasLogoImageUrl = ->
    #   scope.logoImageUrl?.length > 0

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

    scope.hideModal = ->
      scope.show = false

    scope.youtubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

    scope.destroyYoutubePlayer = ->
      scope.player.destroy() if scope.player?

    scope.createYoutubePlayer = (youtube_id) =>
      scope.destroyYoutubePlayer()
      target = "player"
      scope.player = new YT.Player("#{target}",
        width: '160'
        height: '90'
        origin: 'starkey.ahundredyears.com'
        wmode: 'transparent'
        playerVars:
          controls: 0
          enablejsapi: 1
          html5: 1
        videoId: "#{youtube_id}"
      )
      scope.player

    scope.getYoutubeIframeApi = ->
      $.getScript('//www.youtube.com/iframe_api')

    scope.playVideo = (url) ->
      $window.onYouTubeIframeAPIReady = scope.createYoutubePlayer(url)
      scope.getYoutubeIframeApi()

    scope.$watch('show', (newVal, oldVal) ->
      # TODO
      if newVal && !oldVal
        # angular.element(element.find("div")[3]).html("<iframe frameborder='0' ng-src='show | youtubeIframe'></iframe>")
        # Test the if our url matches youtube
        # if scope.youtubePattern.test newVal
        #   youtube_id = newVal.match(scope.youtubePattern)[1]
        #   scope.playVideo(youtube_id)
        # else
        #   scope.destroyYoutubePlayer()

        document.getElementsByTagName("body")[0].style.overflow = "hidden";
      else
        document.getElementsByTagName("body")[0].style.overflow = "";
    )

  template: """
    <div class='ng-modal' ng-show='show'>
      <div class='ng-modal-overlay' ng-click='hideModal()'></div>
      <div class='ng-modal-dialog' ng-style='dialogStyle'>
        <div class='ng-modal-close' ng-click='hideModal()'>X</div>
        <div class='ng-modal-dialog-content'>
          <div id="player"></div>
        </div>
      </div>
    </div>
    """
]
