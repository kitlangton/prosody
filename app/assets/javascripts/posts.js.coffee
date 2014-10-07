window.posts = ->
  $(".new-post-title").focus()
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
    $("div").not(".new-container, .new-post-body, .stay").stop(true,false).transition
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
  $(".new-post-text").autosize()
  $(".new-post-body").transition
    opacity: 1,
    rotateX: 0
  if $(".new-container").length > 0
    window.posts()

$(document).ready ->
  $("#posts .page").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#posts .post-container" # selector for all items you'll retrieve
  , (arrayOfNewElems) ->
    $(".post .body").dotdotdot
      watch: "window"
    $(".post .post-title").dotdotdot
      watch: "window"
    $(@).find(".post").transition
        opacity: .8,
