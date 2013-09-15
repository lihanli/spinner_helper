DISPLAY_NONE_STYLE = 'display: none !important;'

class window.SpinnerHelper
  constructor: (@element) ->
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

    (->
      spinArgs = Array.prototype.slice.call(arguments, 0)
      spinArgs.shift()
      spinArgs.push('small') if spinArgs.length == 0

      @newEl.spin.apply(@newEl, spinArgs)
    ).apply(@, arguments)

  destroy: ->
    @newEl.spin(false).remove()

    @element.attr 'style', (__, oldStyle) ->
      oldStyle.replace(DISPLAY_NONE_STYLE, '')
