# Simplest Kanso Spine App

This is the most basic skeleton Spine app that can be pushed by Kanso to CouchDB.

The instructions below show how to reproduce this code from nothing.  If you want to just use this repository as a starting point then don't forget to run `kanso install` before trying to push.

## Install Spine and Hem
    ~$ sudo npm -g install spine.app hem

## Create the Spine app skeleton

    ~$ spine app simplest
    ~$ cd simplest
    ~/simplest$ ls
    app  package.json  Procfile  readme.md test
    css  node_modules  public    slug.json

This will create the basic folder structure for the Spine app.

The coffeescript Spine application is all in the ~/simpletest/app/ folder.

The root of the web app is in the ~/simplest/public/ folder.  Hem dynamically compiles and stitches together any coffee script files and eco/jeco templates into a file called http://localhost:9294/application.js.  It also dynamically compiles any stylus files into a file called http://localhost:9294/application.css).

We can now run `hem server` and then browse to http://localhost:9294 to see the start-up application

## Build the Spine App

We can use `hem build` to generate the application.js and application.css files and save them to disk in the public folder.  Do this now as we will need these files to push to the CouchApp.

## Turn the Spine app into a Kanso app

We now need to add a kanso.json file to tell Kanso how to build and push this application to CouchDB.

Create a file called kanso.json that looks like this:

    {
        "name": "kanso-spine-simplest",
        "version": "0.0.1",
        "description": "A very simple Kanso - Spine app",
        "dependencies": {
            "attachments": null,
        }
        "attachments": ["public"]
    }

## Push the Kanso App

Now we can build and push the Kanso app to a CouchApp.  Let's assume we are working on a standard local installation.

    ~/simplest$ kanso install .
    ~/simplest$ kanso push http://localhost:5984/simplest

This pushes our design document, called kanso-spine-simplest, to the CouchDB database, called simplest on localhost:5984.

We can now browse to this simplest Spine app, being served up as a CouchApp thanks to Kanso, at
    
    http://localhost:5984/simplest/_design/kanso-spine-simplest/public/index.html

## Remove the Start Up Script

Currently, we have written no Spine code and the standard Spine start-up page is being displayed. Remove this boilder plate start-up script from the public/index.html file: the two lines that look like this:

    <!-- Getting started script - should be removed -->
    <script src="http://maccman-spine.herokuapp.com/start.js" type="text/javascript" charset="utf-8"></script>

