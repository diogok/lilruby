require_relative 'app'
require 'rspec'
require 'rack/test'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe "Hello, lilruby!" do
    it "Can get json from couchdb" do
        r = couch_get();
        r[:db_name].should === "lilruby"
    end
    it "Can render the template with data" do
        get "/"
        last_response.should be_ok
        last_response.body.should include( "Little ruby web app" )
        last_response.body.should include( "Hello, lilruby!" )
    end
end

