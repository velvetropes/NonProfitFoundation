$ ->
  mask     = $('.mobile-menu-mask')
  trigger  = $('.mobile-menu-icon .icon')
  menu     = $('.mobile-menu')
  submenus = $('.mobile-menu .main-menu > li')
  header   = $('header')

  trigger.click ->
    mask.toggleClass 'active'
    menu.toggleClass 'active'
    header.toggleClass 'active'

  mask.click ->
    mask.removeClass 'active'
    menu.removeClass 'active'

  submenus.click ->
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
  blogFeed = $('.blog-articles-list')
  loadMore = $('.blog-articles-list .load-more')

  if $('.next-page-trigger').length > 0
    loadMore.addClass 'visible'

    loadMore.click ->
      $('.next-page-trigger').first().click()
