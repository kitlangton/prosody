# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

loading = (button) ->
  button.text ["Cerebrating...", "Pondering...","Considering..."][Math.floor(Math.random()*3)]
  button.attr "disabled", true
  return

$ ->
  $(".reset-de-plume").click ->
    original = $(@).text()
    $.ajax
      url: "/new_de_plume"
      beforeSend: loading($(@))
      success: (new_plume) =>
        $("#user_nom_de_plume").val new_plume
        $(@).attr "disabled", false
        $(@).text original
