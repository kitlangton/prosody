$ ->
  $(".post .body").dotdotdot()
  $(".post").each (index) ->
    $(this).delay(40*index).transition
      opacity: .8,
