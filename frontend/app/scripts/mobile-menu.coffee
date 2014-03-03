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
