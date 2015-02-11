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

  get '/soho' do
    hood = Neighborhood.new("Soho, New York, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :soho
  end

  get '/williamsburg' do
    hood = Neighborhood.new("Williamsburg, Brooklyn, NY")
    hood.get_recommended_venues
    hood.filter_by_group("Outdoor Seating")
    @recommendations = hood.venues_by_group
    erb :williamsburg
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