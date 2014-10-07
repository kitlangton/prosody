$ ->
  $(".post .body").dotdotdot
    watch: "window"
  $(".post .post-title").dotdotdot
    watch: "window"
  $(".post").transition
      opacity: .8,
  # $(".post").each (index) ->
  #   $(this).delay(40*index).transition
  #     opacity: .8,
