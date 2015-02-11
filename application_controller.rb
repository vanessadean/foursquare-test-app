require 'bundler'
Bundler.require
require './models/foursquare.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/eastvillage' do
    hood = Neighborhood.new("East Village, New York, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :eastvillage
  end

  post '/results' do
    @neighborhood = params[:location]
    hood = Neighborhood.new(params[:location])
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :results
  end

end