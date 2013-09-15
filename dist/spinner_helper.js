// Generated by CoffeeScript 1.4.0
(function() {

  $.fn.spin = function(opts, color) {
    var presets;
    presets = {
      tiny: {
        lines: 8,
        length: 2,
        width: 2,
        radius: 3
      },
      small: {
        lines: 8,
        length: 4,
        width: 3,
        radius: 5
      },
      large: {
        lines: 10,
        length: 8,
        width: 4,
        radius: 8
      }
    };
    if (Spinner) {
      return this.each(function() {
        var $this, data;
        $this = $(this);
        data = $this.data();
        if (data.spinner) {
          data.spinner.stop();
          delete data.spinner;
        }
        if (opts != null) {
          if (typeof opts === "string") {
            if (opts in presets) {
              opts = presets[opts];
            } else {
              opts = {};
            }
            if (color) {
              opts.color = color;
            }
          }
          return data.spinner = new Spinner(opts).spin(this);
        }
      });
    } else {
      throw "Spinner class not available.";
    }
  };

}).call(this);
// Generated by CoffeeScript 1.4.0
(function() {
  var DISPLAY_NONE_STYLE;

  DISPLAY_NONE_STYLE = 'display: none !important;';

  window.SpinnerHelper = (function() {

    function SpinnerHelper(element) {
      this.element = element;
      this.newEl = $('<div>&nbsp;</div>').css({
        'line-height': "" + (this.element.outerHeight()) + "px",
        display: this.element.css('display'),
        width: this.element.outerWidth()
      }).addClass('dynamic-spinner');
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
      }).call(this);
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
