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

sfDirectives.directive "panelTab", [->

  template =  """
    <section>
      <div class='panel-image'>
        <a href='{{featured.video_link_url}}' target='_blank' ng-style="{'background-image': 'url(' + featured.panel_image_url + ')'}">
        </a>
      </div>
      <div class='panel-content'>
        <div>
          <h1>{{featured.panel_title}}</h1>
          <div ng-bind-html="featured.body"></div>
          <p class='call-to-action' ng-hide="featured.panel_call_to_action_link_url==''">
            <a href='{{featured.panel_call_to_action_link_url}}'>
              {{featured.panel_call_to_action_text}} &rarr;
            </a>
          </p>
        </div>
      </div>
    <section>
    """

  restrict: "E"
  template: template
  replace: true
  scope: {
    featured: "="
  }
]

sfDirectives.directive 'homeThumblistNav', [->

  template =  """
    <div class='thumblist-nav horizontal-only'>
      <div>
         <a href ng-click="clickaction(0)">
          <div class="image" ng-style="{'background-image': 'url(/uploads/home/feature/building_a_better_kibera.jpg)'}"></div>
          <div class="content">
            <h4>Global Hearing Mission</h4>
            <button>Read Stories &rarr;</button>
          </div>
        </a>
      </div>
      <div ng-repeat="article in articles">
        <a href ng-click="clickaction($index+1)">
          <div class="image" ng-style="{'background-image': 'url(' + article.thumbnail_image_url + ')'}"></div>
          <div class="content">
            <h4 ng-bind="article.thumbnail_title"></h4>
            <button ng-click="clickaction($index+1)" >{{article.thumbnail_call_to_action_text}} <span ng-hide="article.thumbnail_call_to_action_text==''">&rarr;</span>&nbsp;</button>
          </div>
        </a>
      </div>
    </div>
    """

  link = (scope, element, attrs) ->

    config = { showArrows: false }

    setTimeout( ->
      scope.pane = $('.thumblist-nav')
      scope.pane.jScrollPane(config)
    , 1400)

  restrict: "E"
  link: link
  template: template
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
    ), 800

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
  template: """
    <div class="swiper" ng-class="{'short': isShort()}">
      <div class="swiper-controls" ng-show="showPaginator()">
        <a href class="left" ng-click="prev()"><span class="icon starkey-pg-arrow-left"></span></a>
        <a href class="right" ng-click="next()"><span class="icon starkey-pg-arrow-right"></span></a>
      </div>
      <div id='{{identifier}}' class='swipe'>
        <div class='swipe-wrap' ng-transclude>
        </div>
      </div>
    </div>
    """
  transclude: true
  replace: true
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
# ></slide>

sfDirectives.directive "slide", [ ->

  link = (scope, element, attrs) ->
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

    scope.youttubePattern = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]{11,11}).*$/

    scope.youtubeId = ->
      scope.videoUrl.match(scope.youttubePattern)[1]

    scope.hasVideo = ->
      scope.videoUrl?.length > 0

    scope.hasBlogCategory = ->
      scope.blogCategory?.length > 0

    scope.hasDate = ->
      scope.date?.length > 0

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

    scope.getYoutubeVideoThumbnail = ->
      if scope.hasVideo()
        "http://img.youtube.com/vi/#{scope.youtubeId()}/1.jpg"

    scope.getImage = ->
      # Use imageUrl, and fall back to videoUrl thumb otherwise
      scope.imageUrl or scope.getYoutubeVideoThumbnail()

    scope.backgroundmageStyle = if scope.hasQuote()
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
        $scope.$emit('modal:show', scope.videoUrl)

      else
        # Regular link to external URL
        window.location = "#{scope.linkUrl}"

  controller = ($scope, $element) ->

  slideTemplate = """
    <div class="slide">
      <article ng-style="backgroundmageStyle"></article>
      <blockquote ng-show="hasQuote()">{{quote}}</blockquote>
      <div ng-show="!hasQuote()" class="gradient-background"></div>
      <aside>
        <h1 ng-show="hasHeadline()">{{headline}}</h1>
        <p ng-show="hasBodyCopy()">{{bodyCopy}}</p>
        <div class="logo" ng-show="hasLogoImageUrl()"><img ng-src="{{logoImageUrl}}"/></div>
        <a href ng-class="actionLinkStyle()" ng-show="hasLinkText()" ng-click="displayInModalIfVideo()">{{linkText}}</a>
      </aside>
    </div>
    """

  thumbTemplate = """
    <div>
      <a href='{{linkUrl}}'>
        <div class="image" ng-style="backgroundmageStyle"></div>
        <div class="content">
          <h4 ng-show="hasHeadline()">{{headline}}</h4>
          <p class="blog-category" ng-show="hasBlogCategory()">{{date}}</p>
          <p class="date" ng-show="hasDate()">{{date}}</p>
          <p ng-class='actionLinkStyle()' ng-show="hasLinkText()">
            {{linkText}} &rarr;
          </p>
        </div>
      </a>
    </div>
    """

  result =
    restrict: "E"
    controller: controller
    replace: true
    template: (elem, attr) ->
      if attr.thumblist? and attr.thumblist is "true"
        thumbTemplate
      else
        slideTemplate
    link: link
    scope:
      imageUrl: "@"
      videoUrl: "@"
      linkUrl: "@"
      linkText: "@"
      headline: "@"
      bodyCopy: "@"
      thumblist: "@"
      date: "@"
      blogCategory: "@"
      quote: "@"
      backgroundColor: "@"
      logoImageUrl: "@"
      linkStyle: "@"
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

sfDirectives.directive 'videoPlayerModal', [->
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

    scope.$watch('show', (newVal, oldVal) ->
      if newVal && !oldVal
        console.debug "modalVideo changed to", newVal
        angular.element(element.find("div")[3]).html("<iframe frameborder='0' ng-src='show | youtubeIframe'></iframe>")
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

        </div>
      </div>
    </div>
    """
]
