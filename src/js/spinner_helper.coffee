pixelValue = (value) ->
  "#{value}px"

class @SpinnerHelper
  constructor: (@element, spinParams = 'small') ->
    try
      @oldClickHandler = $._data(@element[0], 'events').click[0].handler
    catch e
      @oldClickHandler = false

    oldHeight = @element.outerHeight()
    oldWidth = @element.outerWidth()
    @oldHtml = @element.html()
    @oldStyle = @element.attr('style')
    @oldStyle = '' unless @oldStyle?

    @element.off 'click'
    @element.html '&nbsp;'

    @element.css 'line-height', pixelValue(oldHeight)
    @element.css 'width',       pixelValue(oldWidth)
    @element.addClass 'spinner'

    @element.spin spinParams
  destroy: ->
    @element.spin false
    @element.attr 'style', @oldStyle
    @element.html @oldHtml
    @element.removeClass 'spinner'
    @element.click(@oldClickHandler) if @oldClickHandler