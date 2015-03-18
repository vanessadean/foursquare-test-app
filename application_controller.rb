require 'bundler'
Bundler.require
require './models/foursquare.rb'
require './models/restaurant.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/eastvillage' do
    @neighborhood = "East Village"
    hood = Neighborhood.new("East Village, New York, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :results
  end

  get '/astoria' do
    @neighborhood = "Astoria"
    hood = Neighborhood.new("Astoria, Queens, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :results
  end

  get '/williamsburg' do
    @neighborhood = "Williamsburg"
    hood = Neighborhood.new("Williamsburg, Brooklyn, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :results
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
