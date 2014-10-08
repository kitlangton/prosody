$ ->
  $("#edit-button").click ->
    $(".show-container").addClass "new-container"
    $("#save-button").show()
    $("textarea").attr "readonly", false
    window.posts()
    $(".new-title").focus()
    $(@).transition
      y: 30
      opacity: 0
    $("#save-button").transition
      x: 57
      opacity: 1

$ ->
  $("#tool-gear").hover (->
    $(@).stop(true,false).transition
      color: 'black'
    ), ->
      $(@).transition
        color: 'grey'

$ ->
  $("#tool-gear").click ->
    if $(@).hasClass "toggled"
      $(@).removeClass "toggled"
      $(".hidden-controls").transition
        opacity: 0
      $(".hidden-controls").children().transition
        y: 0
      $(".hidden-controls").children().attr "disabled", true
    else
      $(".tool-box").transition
        x: 50
      $(@).addClass "toggled"
      $(".hidden-controls").transition
        opacity: 1
      $(".hidden-controls").children().transition
        y: -20
      $(".hidden-controls").children().attr "disabled", false



