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
jQuery 1.8

#### Includes code from:
<a href="http://fgnass.github.com/spin.js/">Felix Gnass</a>  
<a href="https://gist.github.com/1290439">Bradley Smith</a>