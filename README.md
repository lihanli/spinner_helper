spinner_helper
==============

Replaces a DOM element with a CSS3 spinner centered inside the element with the original dimensions unchanged.  

Usage:
```coffeescript
spinnerHelper = new SpinnerHelper $('#submit_button')
```
Call the destroy method to restore the original element with the state unchanged.
```coffeescript
spinnerHelper.destroy()
```

#### Requirements:
jQuery 1.6 - 1.7

<a href="http://fgnass.github.com/spin.js/">Spinner code</a> from Felix Gnass  
<a href="https://gist.github.com/1290439">jQuery extension code</a> from Bradley Smith  