# To Do Kanso Spine App

This is the classic To Do List app built with Spine that can be pushed by Kanso to CouchDB.

It is built upon the simplest Kanso Spine app found here: http://github.com/petebacondarwin/kanso.spine.simplest

The nice thing about this is that the Spine app can be run locally using `hem server` or pushed to a CouchApp with `hem build` then `kanso push...`

## Install Spine and Hem
    ~$ sudo npm -g install spine.app hem

## Install the dependencies

    npm install .
    kanso install .

We can now run `hem server` and then browse to http://localhost:9294 to see the To Do List application

## Build the Spine App

We can use `hem build` to generate the application.js and application.css files and save them to disk in the public folder.  Do this now as we will need these files to push to the CouchApp.

## Push the Kanso App

Now we can build and push the Kanso app to a CouchApp.  Let's assume we are working on a standard local installation.

    kanso push http://localhost:5984/todolist

This pushes our design document, called kanso-spine-todo, to the CouchDB database, called todolist on localhost:5984.

We can now browse to the To Do List Spine app, being served up as a CouchApp thanks to Kanso, at
    
    http://localhost:5984/todolist/_design/kanso-spine-todo/public/index.html
