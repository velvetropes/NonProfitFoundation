app = angular.module('starkey', ['ahundredyears.swiper', 'ahundredyears.thumblist-nav'])

app.controller 'bottomCarouselCtrl', ($scope) ->

app.controller 'heroCarouselCtrl', ($scope) ->

$("#world-map-gdp").vectorMap
  map: "world_mill_en"
  zoomOnScroll: false
  series:
    regions: [
      values: []
      scale: ["#C8EEFF", "#0071A4"]
      normalizeFunction: "polynomial"
    ]


class ProgramsPageView
  constructor: ->
    @setfirstCurrentElement()
    @setupListeners()

  setupListeners: ->
    $(document).on "click", ".tabbed-content li", (e) =>
      e.preventDefault()
      @removeActiveClass()
      @hideTabbedContent()
      @setActiveLink(e.currentTarget)
      @makeActive($(e.currentTarget))

  setActiveLink: (link) =>
    selected_tab = $(link).find("a").data().contentClass
    $(selected_tab).fadeIn()

  setfirstCurrentElement: ->
    @hideTabbedContent()
    currentTab = $(".tabbed-content li").first()
    @makeActive(currentTab)
    @setActiveLink(currentTab)

  makeActive: ($item) ->
    $item.addClass "active"

  removeActiveClass: ->
    $(".tabbed-content li").removeClass "active"

  hideTabbedContent: ->
    $(".tab_content").hide()

$ ->
  if $('.programs-page').length
    new ProgramsPageView
