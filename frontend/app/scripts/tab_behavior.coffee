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

    # @rootElement.on "click", ".tab-content a", (e) =>
    #   e.preventDefault()


class ProgramsPageView extends TabBehavior

  rootElement: $('.tabbed-content')

  constructor: ->
    @setfirstCurrentElement()
    super

  setfirstCurrentElement: ->
    @hideTabbedContent()
    currentTab = $(".tabbed-content li").first()
    @makeActive(currentTab)
    @setActiveLink(currentTab)

$ ->
  new HeaderTabNav
  if $('.programs-page').length
    new ProgramsPageView
