$ ->
  twitterFetcher.fetch('441358329231572992', 'twitter', 1, true)

  mask     = $('.mobile-menu-mask')
  trigger  = $('.mobile-menu-icon .icon')
  menu     = $('.mobile-menu')
  submenus = $('.mobile-menu .main-menu > li')
  header   = $('header')
  submenuLink = $('.mobile-menu .main-menu > li a')

  closeMenu = ->
    mask.removeClass 'active'
    menu.removeClass 'active'
    return

  trigger.click ->
    mask.toggleClass 'active'
    menu.toggleClass 'active'
    header.toggleClass 'active'

  mask.click -> closeMenu()

  submenuLink.click -> closeMenu()

  submenus.click (e) ->
    unless $(e.target).parents('.sub-menu').length > 0
      $('.mobile-menu .main-menu > li.active').not($(@)).each ->
        submenu = $(@)
        $(@).children('ul').slideToggle 200, ->
          submenu.toggleClass 'active'
      submenu = $(@)
      if submenu.hasClass 'active'
        submenu.children('ul').slideToggle 200, ->
          submenu.toggleClass 'active'
      else
        submenu.toggleClass 'active'
        submenu.children('ul').slideToggle 200

  submenuLink.click (e) ->


  $(window).resize ->
    mask.removeClass 'active'
    menu.removeClass 'active'
    header.removeClass 'active'

$ ->
  mapAsFeed = $('.map-as-feed-wrap')
  enteries  = $('.map-as-feed-wrap .entry')
  loadMore  = $('.map-as-feed-wrap .load-more')

  enteries.eq(0).show()
  enteries.eq(1).show()

  if enteries.length > 2
    loadMore.show()

    loadMore.click ->
      enteries = $('.map-as-feed-wrap .entry:hidden')
      enteries.eq(0).fadeIn(200)
      enteries.eq(1).fadeIn(200)
      if !$('.map-as-feed-wrap .entry:hidden').length
        loadMore.hide()

$(window).load ->
  # blogFeed = $('.articles-list')
  loadMore = $('.articles-list .load-more')

  if $('.next-page-trigger').length > 0
    loadMore.addClass 'visible'

  #   loadMore.click ->
  #     $('.next-page-trigger').first().click()


$ ->
  $(document).on "mouseup", ".map", (e) ->
    container = $('#map-popup')
    if !container.is(e.target) && container.has(e.target).length == 0
      container.hide() if container.hasClass('visible')
