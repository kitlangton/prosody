$ ->
  $(".post .body").dotdotdot
    watch: "window"
  $(".post .post-title").dotdotdot
    watch: "window"
  $(".post").transition
      opacity: .8,

$ ->
  $(".main-header").click ->
    $(".lines").stop(true,false).transition
      opacity: 0
      x: 0
    $(".main-header").transition
      color: "grey"
    $(".main-header").transition
      color: "lightgrey"
  $(".main-header").hover (->
    $(".lines").stop(true,false).each (index)->
      $(@).delay(index*100).transition
        opacity: 1
        x: 10
    $(@).stop(true,false).transition
      color: "darkgrey"
      duration: 100
  ), ->
    $(".lines").stop(true,false).transition
      opacity: 0
      x: 0
    $(@).stop(true,false).transition
      color: "lightgrey"
      duration: 100
