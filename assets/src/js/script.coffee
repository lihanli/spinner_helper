dom =
  toggleSpinner: $('.toggle-spinner')
  alertBtn: $('.alert-btn')

(->
  spinnerHelper = false

  dom.toggleSpinner.click ->
    if spinnerHelper
      dom.toggleSpinner.text('start spinner')
      spinnerHelper.destroy()
      spinnerHelper = false
    else
      spinnerHelper = new SpinnerHelper(dom.alertBtn)
      dom.toggleSpinner.text('stop spinner')
)()

dom.alertBtn.click ->
  alert('hello')