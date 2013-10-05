require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/mustache'
require "sinatra/reloader" if development?
require 'rest-client'
require 'multi_json'

config_file 'config.yml'

def couch_get(url="") 
    r = RestClient.get "#{Sinatra::Application.settings.couchdb}#{url}"
    MultiJson.load(r.to_str, :symbolize_keys => true)
end

get '/' do
    data = couch_get()
    mustache :index, {}, data 
end

