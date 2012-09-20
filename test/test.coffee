counter = 0
$ ->
  $('#button').click ->
    $('#output').text counter
    counter++
    spinnerHelper = new SpinnerHelper $(@)
    setTimeout ->
      spinnerHelper.destroy()
    , 1000
