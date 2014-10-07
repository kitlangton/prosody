$ ->
  $(".post .body").dotdotdot
    watch: "window"
  $(".post .post-title").dotdotdot
    watch: "window"
  $(".post").transition
      opacity: .8,

$ ->
  $(".main-header").click ->
    if $(@).hasClass "toggled"
      $(@).removeClass "toggled"
      $(".lines").stop(true,false).transition
        opacity: 0
        x: 0
    else
      $(@).addClass "toggled"
      $(".lines").stop(true,false).transition
        opacity: 1
        x: 10
      $(@).stop(true,false).transition
      color: "lightgrey"
      duration: 100
  $(".main-header").hover (->
    $(@).stop(true,false).transition
      color: "darkgrey"
      duration: 100
    return if $(@).hasClass "toggled"
    $(".lines").stop(true,false).each (index)->
      $(@).delay(index*100).transition
        opacity: 1
        x: 10
  ), ->
    $(@).stop(true,false).transition
      color: "lightgrey"
      duration: 100
    return if $(@).hasClass "toggled"
    $(".lines").stop(true,false).transition
      opacity: 0
      x: 0


$ ->
  special = [
    "reveal"
    "top"
    "boring"
    "perspective"
    "extra-pop"
  ]
  $(".main-header").click ->
    transitionClass = $(this).data("transition")
    if $.inArray(transitionClass, special) > -1
      $("body").removeClass()
      $("body").addClass transitionClass
    else
      $("body").removeClass()
      $("#site-canvas").removeClass()
      $("#site-canvas").addClass transitionClass
    $("#site-wrapper").toggleClass "show-nav"
    false

  return

