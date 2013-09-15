$.fn.spin = (opts, color) ->
  presets =
    tiny:
      lines: 8
      length: 2
      width: 2
      radius: 3

    small:
      lines: 8
      length: 4
      width: 3
      radius: 5

    large:
      lines: 10
      length: 8
      width: 4
      radius: 8

  if Spinner
    @each ->
      $this = $(this)
      data = $this.data()
      if data.spinner
        data.spinner.stop()
        delete data.spinner
      if opts?
        if typeof opts is "string"
          if opts of presets
            opts = presets[opts]
          else
            opts = {}
          opts.color = color if color

        data.spinner = new Spinner(opts).spin(this)
  else
    throw "Spinner class not available."