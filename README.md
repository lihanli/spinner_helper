spinner_helper
==============

<a href="http://lihanli.github.io/spinner_helper/" target="_blank">Demo</a>

Hides a DOM element, creates a new one next to it with the original element's dimensions, adds a vertically and horizonally centered css spinner inside the new element.

#### Usage
```javascript
var spinnerHelper = new SpinnerHelper($('#el'));
```

Call the destroy method to delete the spinner and unhide the original element.
```javascript
spinnerHelper.destroy();
```

#### Installation

Download the dist/spinner_helper.js file and add it to your page.

Or install with bower:
```
$ bower install spinner_helper
```

#### Requirements
jQuery >= 1.7.2  
<a href="http://fgnass.github.com/spin.js" target="_blank">spin.js</a>
