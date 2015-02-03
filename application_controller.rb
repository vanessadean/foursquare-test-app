require 'bundler'
Bundler.require
require './models/foursquare'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/eastvillage' do
    hood = Neighborhood.new("East Village, New York, NY")
    @recommendations = hood.get_recommended_venues
    erb :eastvillage
  end

  post '/results' do
    hood = Neighborhood.new(params[:location])
    @recommendations = hood.get_recommended_venues
  end

end