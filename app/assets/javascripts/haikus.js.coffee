$ ->
  $(".post").hover (-> 
    $(this).find(".user-email").fadeIn("linear")
  ), ->
    $(this).find(".user-email").fadeOut("linear")
