$ ->
  $(".post .body").dotdotdot
    watch: "window"
  $(".post .post-title").dotdotdot
    watch: "window"
  $(".post").each (index) ->
    $(this).delay(40*index).transition
      opacity: .8,
  $(".main-header").transition
    color: "lightgrey"
  $(".main-header").transition
    color: "grey"
  $(".main-header").transition
    color: "lightgrey"

$ ->
  $(".main-header").click ->
    $("html, body").animate
      scrollTop: 0
    , "slow"
    false
    $(".main-header").transition
      color: "grey"
    $(".main-header").transition
      color: "lightgrey"
