100YRS - Frontend Boilerplate
===

This example aims to be a fairly sane starting point for most frontend projects. Repetitive tasks (such as minification, compilation, unit testing, linting, etc) are carried out by [Grunt](http://gruntjs.com/). see the Gruntfile for specific task info - _more documentation is in the works, hold tight!_

Installation
---
For node dependencies, from the app directory, run:

	npm install
		
For javascript dependencies, use [Bower](http://bower.io/). From the app directory, run:

	bower install
	grunt bower-install # Injects bower components into the html template
		
Serve it.
---
	grunt serve
		
Test it.
---
	grunt test
		
Build it.
---
	grunt build
		