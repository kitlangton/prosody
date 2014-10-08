$ ->
  $(".post").hover (-> 
    $(this).find(".date-created").stop(true,false).fadeIn("linear")
  ), ->
    $(this).find(".date-created").stop(true,false).fadeOut("linear")
