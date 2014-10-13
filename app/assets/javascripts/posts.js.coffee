getSelected = ->
  if window.getSelection
    return window.getSelection()
  else if document.getSelection
    return document.getSelection()
  else
    selection = document.selection and document.selection.createRange()
    return selection.text  if selection.text
    return false
  false


insertButton = ->
  selectionButton = new Element("span",
    className: "nytd_selection_button"
    id: "nytd_selection_button"
    title: "Lookup Word"
    style: "margin:-20px 0 0 -20px; position:absolute; background:url(http://graphics8.nytimes.com/images/global/word_reference/ref_bubble.png);width:25px;height:29px;cursor:pointer;_background-image: none;filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\"http://graphics8.nytimes.com/images/global/word_reference/ref_bubble.png\", sizingMethod=\"image\");"
  )
window.showpost = ->
  $(".show-post-text").mouseup ->
    selection = getSelected()
    $("#quote-text").text selection
    $("#comment_quote").val selection
    $("#modal-click").click()
    # alert selection  if selection
    return

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
  if $(".show-container").length > 0
    window.showpost()
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
