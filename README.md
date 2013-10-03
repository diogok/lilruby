# Little Ruby Web App

This a little Ruby Web App, just to get the basics.

It uses what I like to use the most: Mustache templates and CouchDB, with sinatra for the main app stuff.

## Installing and running

Start with git, obviously:

    # aptitude install git

Now clone the app, and enter it's directory:

    $ git clone git@github.com:diogok/lilruby.git 
    $ cd lilruby

You will need ruby, as expected:

    # aptitude install ruby

Them bundler, to deal with dependencies:

    # gem install bundler

Use bundler to solve dependencies (take a look at Gemfile):

    $ bundle install

Install CouchDB and create our little database:

    # aptitude install couchdb
    # curl -X PUT http://localhost:5984/lilruby

Run the tests:

    $ rspec app_test.rb

Run the application:
    
    $ shotgun config.ru


## The app

Does nothing, really. But is organized as follow, check them all:

- At config.yml you got environment specific settings
- At config.ru you get the startup script
- At app.rb it's the base application
- At public the assets to be served (js, css, etc... ), with bootstrap stuff
- At views are the mustache templates
- At app\_test.rb, the test suite

### How it works

- ruby as the language
- sinatra for the app and routing
- rspec for tests
- sinatra-mustache for logicless templating(acting as views, without boring classes)
- sinatra-config-file for config handling
- rest-client for rest consuming (for couchdb)
- multi\_json for json handling (for couchdb)
- shotgun for app reloading

And I guess that's it, for now.

