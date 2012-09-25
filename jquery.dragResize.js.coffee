# JQuery DragResize
#
# Version: 1.0
# Author: Shiv Deepak <shiv@interviewstreet.com>
# Date: 25 Sept 2012

(($) ->
  $.dragResize = {version: '1.0'}
  $.fn.dragResize = (options) ->
    default_options = {
      resize: (pageX, pageY) ->
      activeColor: "#AAA"
      inactiveColor: "#DDD"
    }
    that = @
    options = $.extend(default_options, options)
    enable_resize = false

    $(@).mousedown (e) ->
      enable_resize = true
      return false

    $(@).mouseup (e) ->
      enable_resize = false

    $(@).mouseenter (e) ->
      $(that).css('background-color', options.activeColor)

    $(@).mouseleave (e) ->
      $(that).css('background-color', options.inactiveColor)

    $(window).mouseout (e) ->
      if e.relatedTarget == null
        enable_resize = false

    $(window).mousemove (e) ->
      if enable_resize == true
        if e.pageY < 0 or e.pageY > document.height or e.pageX < 0 or e.pageX > document.width
          enable_resize = false
        options.resize(e.pageX, e.pageY)
) $