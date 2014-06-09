StarkeyFoundation
==============


We're using Vagrant with Virtual Box as our development environments. In a nutshell, vagrant is an interface to be able to use virtual machines in the command line. 

This is the list of software required (basic setup):

  1. Apple Xcode Command Line Tools: https://developer.apple.com/downloads/
  2. Homebrew: http://brew.sh/
  3. VirtualBox: https://www.virtualbox.org/wiki/Downloads
  4. Vagrant: http://www.vagrantup.com/downloads.html

NOTE
---
Good idea to install those in that same order, since some are dependencies of others, and all those should be installed in your local machine.





Below are notes from 100years:
==============

Launching a Vagrant-based local environment
---

1. Install [VirtualBox](https://www.virtualbox.org/) & [Vagrant](http://www.vagrantup.com/)
2. Initiate `vagrant up` command from this directory
3. Allow a few minutes for Vagrant to provision the virtual server
4. Add the follow hosts to your hosts file:

`10.11.0.101     starkey.local`

frontend/ (front end dev)
========

NOTE
---
This should be used mainly for making major structural changes to the front end code layout and does require a good amount of modification to merge back into the ExpressionEngine base. Proceed with caution!

Installation
---
For node dependencies, from the app directory, run:

    npm install

For to install JavaScript dependencies, use [Bower](http://bower.io/). From the app directory, run:

    bower install

To instantiate an local web server instance of the code:
---
    grunt serve

To build and parse into correct ExpressionEngine folders when ready:
---
    grunt build
