disableClick = (element) ->
  element.off 'click'
  element.attr 'onclick', ''
  element.css 'cursor', 'default'

pixelValue = (value) ->
  "#{value}px"

class @SpinnerHelper
  constructor: (@element, spinParams = 'small') ->
    try
      @oldClickHandler = @element.data("events")["click"][0].handler
    catch e
      @oldClickHandler = false

    oldHeight = @element.outerHeight()
    oldWidth = @element.outerWidth()
    @oldHtml = @element.html()
    @oldStyle = @element.attr('style')
    @oldStyle = '' unless @oldStyle?

    disableClick @element
    @element.html '&nbsp;'
    @element.css
      'background-image': 'none'
      'background-color': 'transparent'
      border:             'none'
      'box-shadow':       'none'
      'line-height':      pixelValue(oldHeight)
      overflow:           'visible'
      padding:            '0'

    @element.width oldWidth
    @element.addClass 'no_select'

    @element.spin spinParams
  destroy: ->
    @element.spin false
    @element.attr 'style', @oldStyle
    @element.html @oldHtml
    @element.removeClass 'no_select'
    @element.click(@oldClickHandler) if @oldClickHandler