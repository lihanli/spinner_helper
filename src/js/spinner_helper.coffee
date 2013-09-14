DISPLAY_NONE_STYLE = 'display: none !important;'

class window.SpinnerHelper
  constructor: (@element, spinParams = 'small') ->
    @newEl = $('<div>&nbsp;</div>')
      .css
        'line-height': "#{@element.outerHeight()}px"
        display: @element.css('display')
        width: @element.outerWidth()
      .addClass('dynamic-spinner')

    @element
      .attr 'style', (__, oldStyle) ->
        "#{$.trim(oldStyle)}#{DISPLAY_NONE_STYLE}"
      .after(@newEl)

    @newEl.spin spinParams
  destroy: ->
    @newEl.spin(false).remove()
    @element.attr 'style', (__, oldStyle) ->
      oldStyle.replace(DISPLAY_NONE_STYLE, '')
