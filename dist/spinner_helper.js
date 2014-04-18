/**
 * Copyright (c) 2011-2013 Felix Gnass
 * Licensed under the MIT license
 */

/*

Basic Usage:
============

$('#el').spin(); // Creates a default Spinner using the text color of #el.
$('#el').spin({ ... }); // Creates a Spinner using the provided options.

$('#el').spin(false); // Stops and removes the spinner.

Using Presets:
==============

$('#el').spin('small'); // Creates a 'small' Spinner using the text color of #el.
$('#el').spin('large', '#fff'); // Creates a 'large' white Spinner.

Adding a custom preset:
=======================

$.fn.spin.presets.flower = {
  lines: 9
  length: 10
  width: 20
  radius: 0
}

$('#el').spin('flower', 'red');

*/

(function(factory) {

  if (typeof exports == 'object') {
    // CommonJS
    factory(require('jquery'), require('spin'))
  }
  else if (typeof define == 'function' && define.amd) {
    // AMD, register as anonymous module
    define(['jquery', 'spin'], factory)
  }
  else {
    // Browser globals
    if (!window.Spinner) throw new Error('Spin.js not present')
    factory(window.jQuery, window.Spinner)
  }

}(function($, Spinner) {

  $.fn.spin = function(opts, color) {

    return this.each(function() {
      var $this = $(this),
        data = $this.data();

      if (data.spinner) {
        data.spinner.stop();
        delete data.spinner;
      }
      if (opts !== false) {
        opts = $.extend(
          { color: color || '#000' },
          $.fn.spin.presets[opts] || opts
        )
        data.spinner = new Spinner(opts).spin(this)
      }
    })
  }

  $.fn.spin.presets = {
    tiny: { lines: 8, length: 2, width: 2, radius: 3 },
    small: { lines: 8, length: 4, width: 3, radius: 5 },
    large: { lines: 10, length: 8, width: 4, radius: 8 }
  }

}));
// Generated by CoffeeScript 1.7.1
(function() {
  var DISPLAY_NONE_STYLE;

  DISPLAY_NONE_STYLE = 'display: none !important;';

  window.SpinnerHelper = (function() {
    function SpinnerHelper(element) {
      var marginType, type, _i, _len, _ref;
      this.element = element;
      this.newEl = $('<div>&nbsp;</div>').css({
        'line-height': "" + (this.element.outerHeight()) + "px",
        display: this.element.css('display'),
        width: this.element.outerWidth()
      }).addClass('dynamic-spinner');
      _ref = ['top', 'left', 'bottom', 'right'];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        type = _ref[_i];
        marginType = "margin-" + type;
        this.newEl.css(marginType, this.element.css(marginType));
      }
      this.element.attr('style', function(__, oldStyle) {
        return "" + ($.trim(oldStyle)) + DISPLAY_NONE_STYLE;
      }).after(this.newEl);
      (function() {
        var spinArgs;
        spinArgs = Array.prototype.slice.call(arguments, 0);
        spinArgs.shift();
        if (spinArgs.length === 0) {
          spinArgs.push('small');
        }
        return this.newEl.spin.apply(this.newEl, spinArgs);
      }).apply(this, arguments);
    }

    SpinnerHelper.prototype.destroy = function() {
      this.newEl.spin(false).remove();
      return this.element.attr('style', function(__, oldStyle) {
        return oldStyle.replace(DISPLAY_NONE_STYLE, '');
      });
    };

    return SpinnerHelper;

  })();

}).call(this);
