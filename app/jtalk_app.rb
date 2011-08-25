require 'rubygems'
require 'bundler'
Bundler.require

RACK_ROOT = File.expand_path('..', File.dirname(__FILE__))

class JTalkWebApp < Sinatra::Base
  set :root, RACK_ROOT

  use Rack::Sprockets, :root => RACK_ROOT

  get '/' do
    haml :index
  end
end

JTalkApp = Rack::Builder.new do
  use Rack::ShowExceptions
  use Rack::CommonLogger

  map '/js' do
    run RackDAV::Handler.new(:root => File.expand_path('app/javascripts', RACK_ROOT))
  end

  map '/st' do
    run RackDAV::Handler.new(:root => File.expand_path('app/smalltalk', RACK_ROOT))
  end

  map '/' do
    run JTalkWebApp
  end
end
