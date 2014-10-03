$ ->
  $(".post").hover (-> 
    $(this).find(".user-email").stop(true,false).fadeIn("linear")
  ), ->
    $(this).find(".user-email").stop(true,false).fadeOut("linear")
