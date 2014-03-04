$ ->
  mask    = $('.mobile-menu-mask')
  trigger = $('.mobile-menu-icon .icon')
  menu    = $('.mobile-menu')
  spans   = $('.mobile-menu .main-menu > li')

  trigger.click ->
    mask.toggleClass 'active'
    menu.toggleClass 'active'

  mask.click ->
    mask.removeClass 'active'
    menu.removeClass 'active'

  spans.click ->
    span = $(@)
    if span.hasClass 'active'
      span.children('ul').slideToggle 200, ->
        span.toggleClass 'active'
    else
      span.toggleClass 'active'
      span.children('ul').slideToggle 200

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
