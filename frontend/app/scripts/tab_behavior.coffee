class TabBehavior

  rootElement: $(document)

  constructor: ->
    @setupListeners()

  setupListeners: ->
    @rootElement.on "click", "li", (e) =>
      e.preventDefault()
      @removeActiveClass()
      @hideTabbedContent()
      @setActiveLink(e.currentTarget)
      @makeActive($(e.currentTarget))

  setActiveLink: (link) =>
    selected_tab = $(link).find("a").data().contentClass
    $(selected_tab).fadeIn()

  makeActive: ($item) ->
    $item.addClass "active"

  removeActiveClass: ->
    @rootElement.find("li").removeClass "active"

  hideTabbedContent: ->
    @rootElement.find(".tab-content").hide()

class HeaderTabNav extends TabBehavior

  rootElement: $('.header-nav')

  constructor: ->
    @hideTabbedContent()
    super

  setupListeners: ->
    @rootElement.on "click", "ul.tabs li", (e) =>
      e.preventDefault()
      isActive = $(e.currentTarget).hasClass('active')
      @removeActiveClass()
      @hideTabbedContent()
      unless isActive
        @setActiveLink(e.currentTarget)
        @makeActive($(e.currentTarget))

class ProgramsPageView

  constructor: ->
    @setupListeners()

  setupListeners: ->
    $(document).on "click", ".become-a-provider", (e) ->
      e.preventDefault()
      $('.programs-page .become-a-provider-container').toggleClass("hidden")

$ ->
  new HeaderTabNav
  if $('.programs-page').length
    new ProgramsPageView

  # Remove unwanted link border outlines
  runOnLoad = new Array()
  window.onload = ->
    i = 0

    while i < runOnLoad.length
      runOnLoad[i]()
      i++
    return

  if document.getElementsByTagName
    for i of a = document.getElementsByTagName("a")
      a[i].onmousedown = ->
        @blur() # most browsers
        @hideFocus = true # internet explorer
        @style.outline = "none" # mozilla
        return

      a[i].onmouseout = a[i].onmouseup = ->
        @blur() # most browsers
        @hideFocus = false # internet explorer
        @style.outline = null # mozilla
        return