# Little Ruby Web App

This a little Ruby Web App, just to get the basics.

It uses what I like to use the most: Mustache templates and CouchDB, with sinatra for the main app stuff.

## Installing and running

Start with git, obviously:

    # aptitude install git

Now clone the app, and enter it's directory:

    $ git clone git@github.com:diogok/lilruby.git 
    $ cd lilruby

### Vagrant

You can use [Vagrant](http://vagrantup.com) to create a dev environment without too much work, just download and install vagrant and virtualbox.

To start the machine use:

    $ vagrant up

To run the server:

    $ vagrant ssh -c 'cd /vagrant && rackup'

To simply access the machine created use "vagrant ssh". This source directory is shared between both at the vms /vagrant.

You can also create a deployable war with

    $ vagrant ssh -c 'cd /vagrant && warble executable war'

You can deploy the war to a java container(like tomcat), or you can run the war with:

    $ java -jar lilruby.war

Rackup(your app) you be available at [port 9494](http://localhost:9494) and couchdb at [port 5999](http://localhost:5999).


### Manual

If not using vagrant(greatly recommended), you can do things manualy.

You will need ruby, as expected:

    # aptitude install ruby

Install RVM for ruby versions control, them install jRuby:

    $ curl -L https://get.rvm.io | bash -s stable
    $ echo 'source $HOME/.rvm/scripts/rvm' >> ~/.bashrc
    $ rvm install jruby
    $ rvm use jruby
    $ cd .

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

    $ RACK_ENV=production warble executable war

You can deploy the war to a java container(like tomcat), or you can run the war with:

    $ java -jar lilruby.war

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
- At Vagrantfile the dev vms configuration
- At bootstrap the installation script for the dev vm

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
- vagrant for development environment

And I guess that's it, for now.

