require 'rubygems'
require 'sinatra'
require 'json'
require 'logger'
require 'geoip'
require 'colorize'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].sort.each {|file| require file}

module LocationTracker
  class App < Sinatra::Base
    set :logging, true
    set :raise_errors, true
    set :show_exceptions, false


    get '/' do
      ip = params['ip']
      Tracker.get_details(ip).to_json
    end

    get '/country_codes' do
      ip = params['ip']
      Tracker.country_codes(ip)
    end

  end
end
