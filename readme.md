# To Do Kanso Spine App

This is the classic To Do List app built with Spine that can be pushed by Kanso to CouchDB.

It is built entirely with Kanso packages, having no dependency on the build tools provided with Spine (i.e. Hem)


## Install the dependencies

    kanso install .

(Note at the time of writing there are a couple of issues with the packages upon which we are depending.  Take a look below for how to fix these.)

## Push the Kanso App

Now we can build and push the Kanso app to a CouchApp.  Let's assume we are working on a standard local installation.

    kanso push todolist

This pushes our design document, called kanso-spine-todo, to the CouchDB database, called todolist on localhost:5984.

We can now browse to the To Do List Spine app, being served up as a CouchApp thanks to Kanso, at:
    
    http://localhost:5984/todolist/_design/kanso-spine-todo/public/index.html


## Fixing broken dependencies

At the time of writing the following packages need modification to work.  Hopefully by the time you read this the package owners will have updated them.

### stylus-precompiler
With a minimal application (i.e. without duality, etc.) the stylus precompiler package fails to attach the compiled css to the design document.  Open up`packages/stylus-precompiler/build/compile.js` and change the `compile_attachment` function to this:

    compile_attachment = function(doc, path, settings, filename, callback) {
      var name;
      name = utils.relpath(filename, path).replace(/\.styl$/, ".css");
      return compile_stylus(path, filename, settings, function(err, css) {
        if (err) {
          return callback(err);
        }
        attachments.add(doc, name, name, new Buffer(css).toString("base64"));
        return callback();
      });
    };

### jquery
The current version of this package does not export the jQuery object from the CommonJS module.  Add this line to the bottom of `packages/jquery/jquery.js` file:

    module.exports = jQuery;

