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

    scope.selectTopLevelList = (continent) ->
      scope.selectedList = continent

    scope.initializeMaps = ->
      $timeout( ->
        $("#missions-world-map").vectorMap
          map: "world_mill_en"
          zoomOnScroll: false
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


  template = """
    <div class="missions-map">
      <div class="map-container">
        <section class='map missions-world-map' ng-style="{'z-index': worldMapZIndex}">
          <div id='missions-world-map'>
          </div>
        </section>
        <section class='map missions-us-map' ng-style="{'z-index': usMapZIndex}">
          <div id='missions-us-map'>
          </div>
        </section>
      </div>
      <div class="missions-map-greeting" ng-hide="hasContinentAndCountry()">
        <h1>Our<br/>Global Impact</h1>
        <p><a href ng-click="showContinent(data.continents[0])">Explore regions &gt;&gt;</a></p>
      </div>
      <div class="missions-map-info" ng-show="hasContinentAndCountry()">
        <div class="country-info" ng-show="hasCountry()">
          <h4>{{currentCountry.name}}</h4>
          <h1>{{currentCountry.total_hearing_aids_provided}}</h1>
          <p>hearing aids provided since 2010</p>
        </div>

        <div class="continent-info" ng-show="hasContinent()">
          <h4>{{currentContinent.name}}</h4>
          <h1>{{currentContinent.total_hearing_aids_provided}}</h1>
          <p>hearing aids provided since 2010</p>
          <h1>{{currentContinent.countries_visited.length}}</h1>
          <p>{{countryOrState()}} visited</p>
        </div>

      </div>
      <div class="missions-map-legend">
        <h3>Hearing Mission Regions</h3>
        <ul class="continents">
          <li ng-repeat="continent in data.continents" ng-click="selectTopLevelList(continent)" ng-class="{active: continent == selectedList}">
            <a href ng-click="showContinent(continent)">{{continent.name}}</a>
            <ul ng-class="countryClass(continent.name)">
              <li ng-repeat="country in continent.countries_visited">
                <a href ng-click="showCountry(country, continent)">{{country.name}}</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    """
  restrict: "E"
  link: link
  controller: controller
  template: template
  replace: true
  scope:
    data: "="
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

  slideTemplate = """
    <div class="slide">
      <article ng-style="backgroundImageStyle"></article>
      <blockquote ng-show="hasQuote()">{{quote}}</blockquote>
      <div ng-show="!hasQuote()" class="gradient-background"></div>
      <div ng-show="hasVideo()" class="play-video-link">
        <a href ng-click="displayInModalIfVideo()"><span class="icon starkey-legend-3"></a>
      </div>
      <aside ng-class="{'side-panel': hasSidePanel()}">
        <h1 ng-show="hasHeadline()" class="headline">{{headline}}</h1>
        <p ng-show="hasSubhead()" class="subhead">{{subhead}}</p>
        <p ng-show="hasBodyCopy()" class="body-copy">{{bodyCopy}}</p>
        <div class="logo" ng-show="hasLogoImageUrl()">
          <img ng-src="{{logoImageUrl}}"/>
        </div>
        <a href="{{linkUrl}}" target="_blank" ng-class="actionLinkStyle()" ng-show="!hasVideo() && hasLinkText() && !hasDetailPage()">
          {{linkText}}
        </a>
        <a href class="action-link" ng-show="hasVideo()" ng-click="displayInModalIfVideo()">
          Watch video
        </a>
        <a href="{{linkUrl}}" class="action-link" ng-show="hasDetailPage()">
          {{linktext || "Read More"}} &rarr;
        </a>
      </aside>
    </div>
    """

  thumbTemplate = """
    <div>
      <a href='{{linkUrl}}'>
        <div class="image" ng-style="backgroundImageStyle"></div>
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


  pressReleaseDetailTemplate = """
    <article>
      <div class="article-header-image">
        <div class="image" ng-style="{'background-image': 'url(' + headerImageUrl + ')'}">
          <ul class="page-nav-links">
            <li>
              <a href="#/{{detailPageType}}/">&larr;</a>
            </li>
            <li>
              <a href="#/{{detailPageType}}/">&rarr;</a>
            </li>
            <li>
              <a href="#">X</a>
            </li>
          </ul>
          <div class="gradient-background"></div>
        </div>
      </div>
      <br/>
      <br/>
      <br/>
      <div class="outer-container detail-page-body">
        <section class='page-leader'>
          <h1>Press Release</h1>
          <h3>For immediate release</h3>
        </section>
        <h1 class="article-headline">{{title}}</h1>
        <p class="article-date">{{date}}</p>
        <h3 class="article-subheadline">{{subhead}}</h3>
        <div ng-bind-html="body"></div>
        <div class="share-this-post">
          <ul>
            <li><span class="note">Share this post</span></li>
            <li>
              <a href="#">
                <span class="icon starkey-share-twitter"></span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="icon starkey-share-fb"></span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="icon starkey-share-email"></span>
              </a>
            </li>
          </ul>
        </div>

      </div>
    </article>
    """
  blogDetailTemplate = """
    <article>
      <div class="article-header-image">
        <div class="image" ng-style="{'background-image': 'url(' + headerImageUrl + ')'}">
          <ul class="page-nav-links">
            <li>
              <a href="#/{{detailPageType}}/">&larr;</a>
            </li>
            <li>
              <a href="#/{{detailPageType}}/">&rarr;</a>
            </li>
            <li>
              <a href="#">X</a>
            </li>
          </ul>
          <div class="gradient-background"></div>
          <div class="outer-container">
            <div class="relative-container">
              <div class="banner">
                <p class="article-item-category">{{category}}</p>
                <h1  class="article-title">{{title}}</h1>
                <p>{{date}} | {{author}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br/>
      <div ng-bind-html="body"></div>
      <div class="outer-container">
        <div class="share-this-post">
          <ul>
            <li><span class="note">Share this post</span></li>
            <li>
              <a href="#">
                <span class="icon starkey-share-twitter"></span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="icon starkey-share-fb"></span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="icon starkey-share-email"></span>
              </a>
            </li>
          </ul>
        </div>

      </div>
    </article>
    """
  result =
    restrict: "E"
    replace: true
    template: blogDetailTemplate
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
      if scope.type is "press_release"
        "Press Release"
      else
        "Media Mention"

    scope.parseDate = (date) ->
      Date.parse(date)

    scope.linkByType = ->
      if scope.type?
        if scope.type is "press_release"
          "press_release"
        else if scope.type is "media_mention"
          if scope.videoLink?.length > 0
            "media_mention_with_video"
          else if scope.detailPage?.length > 0 and scope.detailPage is "true"
            "media_mention_with_detail_page"
          else
            "media_mention"
        else
          "default"
      else
        "default"

    scope.displayInModalIfVideo = ->
      if scope.hasVideo()
        scope.$emit('modal:show', scope.videoLink)

  template = """
    <div class='block'>
      <div class="image" ng-style="{'background-image': 'url(' + headerImageUrl + ')'}"></div>
      <p class="category">{{getCategory()}}</p>
      <h2 class="headline">{{title}}</h2>
      <p class='date'>{{parseDate(date) | date:"MMMM d yyyy"}}</p>
      <p class='read-more' ng-switch="linkByType()">
        <a ng-switch-when="press_release" href="#/press_releases/{{id}}">
          Read more &rarr;
        </a>
        <a ng-switch-when="media_mention" href="{{callToActionLink}}" target="_blank">
          Read more &rarr;
        </a>
        <a ng-switch-when="media_mention_with_detail_page" href="#/media_mentions/{{id}}">
          Read more &rarr;
        </a>
        <a ng-switch-when="media_mention_with_video" href ng-click="displayInModalIfVideo()">
          Watch Video &rarr;
        </a>
      </p>
    </div>
    """

  result =
    restrict: "E"
    replace: true
    template: template
    link: link
    scope:
      id: "@"
      feedUrl: "@"
      title: "@"
      date: "@"
      year: "@"
      detailPage: "@"
      type: "@"
      featured: "@"
      headerImageUrl: "@"
      logoImageUrl: "@"
      quote: "@"
      callToActionText: "@"
      callToActionLink: "@"
      videoLink: "@"
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
