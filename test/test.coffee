counter = 0
$ ->
  $('#button').click ->
    spinnerHelper = new SpinnerHelper $(@)
    setTimeout ->
      spinnerHelper.destroy()
      $('#output').text counter
      counter++
    , 1000
