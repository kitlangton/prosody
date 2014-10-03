window.posts = ->
  presses = 0
  $(".new-post-text").keyup ->
    presses += 1
    return if presses < 8
    $(".new-container").transition
      y: -50,
      duration: 600
    $(".top-bar").stop(true,false).transition
      opacity: 0,
      duration: 600
    $("div").not(".new-container, .new-post-body").stop(true,false).transition
      opacity: 0,
      duration: 600
  $("div").mouseenter ->
    presses = 0
    $(".new-container").stop(true).transition
      y: 0,
      duration: 600
    $(".top-bar").transition
      opacity: 1
    $("div").not(".new-container, .new-post-body").transition
      opacity: 1
  $("div").mouseleave ->
    $(".top-bar").transition
      opacity: 1
    $("div").not(".new-container, .new-post-body").transition
      opacity: 1

$ ->
  $(".new-post-body").transition
    opacity: 1,
    rotateX: 0
  if $(".new-container").length
    window.posts()
