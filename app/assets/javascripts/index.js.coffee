$ ->
  $(".post .body").dotdotdot
    watch: "window"
  $(".post .post-title").dotdotdot
    watch: "window"
  $(".post").each (index) ->
    $(this).delay(40*index).transition
      opacity: .8,
