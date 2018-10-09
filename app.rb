require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "models/restaurant"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post '/restaurants' do
  resto = Restaurant.create(
    name: params[:name],
    capacity: params[:capacity].to_i,
    address: params[:address]
  )
  redirect "/restaurants/#{resto.id}"
end
