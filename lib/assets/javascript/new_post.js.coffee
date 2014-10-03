# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$ ->
  $(".new-post-body").slideDown()
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

