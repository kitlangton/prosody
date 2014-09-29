
class Haiku
  constructor: (@form) ->
    @stats = new textstatistics("")
  init: =>
    @form.on "keyup", @updateSyllables
    @form.keydown (e) =>
      if e.keyCode is 13 and @form.val().split('\n').length > 2
        @flashError("Haikus are three lines.")
        return false
  change_text: (obj, el, count) =>
    el.text obj()
    if obj() == count
      el.addClass "ideal"
    else
      el.removeClass "ideal"
  updateSyllables: =>
    @change_text @first_line, $('#first-line'), 5
    @change_text @second_line, $('#second-line'), 7
    @change_text @third_line, $('#third-line'), 5
  flashError: (error) =>
    $('#error-display').text error
    $('#error-display').fadeIn(500).fadeOut(500)
  first_line: =>
    if @haiku_line(1).length == 0 then return "0"
    @num_syllables(1)
  second_line: =>
    if @haiku_line(2).length == 0 then return "0"
    @num_syllables(2)
  third_line: =>
    if @haiku_line(3).length == 0 then return "0"
    @num_syllables(3)
  num_syllables: (line) =>
    new textstatistics().syllableCount(@haiku_line(line))
  haiku_lines: =>
    @form.val().split('\n')
  haiku_line: (line) =>
    @haiku_lines()[line-1]
$ ->
  haiku = new Haiku $('#Haiku_Body')
  haiku.init()
