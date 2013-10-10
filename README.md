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

Install RVM for ruby versions control, them install jRuby:

    $ curl -L https://get.rvm.io | bash -s stable
    $ echo 'source /home/diogo/.rvm/scripts/rvm' >> ~/.bashrc
    $ rvm install jruby
    $ rvm use jruby

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
    
    $ rackup

Create deployable war:

    $ warble war

## The app

Does nothing, really. But is organized as follow, check them all:

- At .ruby-version we tell to use jruby as ruby version
- At Gemfile the dependencies
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
- sinatra-reloader  (from sinatra-contrib) for code reload
- rest-client for rest consuming (for couchdb)
- multi\_json for json handling (for couchdb)
- warbler is used to generate deployable war file

And I guess that's it, for now.

