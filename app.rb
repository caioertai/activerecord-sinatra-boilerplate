# Config and requirements for Sinatra
require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# This defines a path to '/' (the root of the app)
get "/" do
  # We assign to @restaurants all the restaurants from our DB
  # this is going to be available in our view
  @restaurants = Restaurant.all

  # We tell sinatra to render (display to the user) the
  # file at 'views/index.erb'
  erb :index
end

# This defines the show page for our restaurants at
# the path '/restaurants/:id' where ':id' is going to
# be the id of this particular restaurant. So in the
# path '/restaurants/12' we would be displaying the
# restaurant of id 12
get '/restaurants/:id' do
  # We assign to @restaurant of the particular restaurant id
  # used in our path. This instance variable is going to be available
  # in our view.
  @restaurant = Restaurant.find(params[:id])
  # The 'params' variable above is a hash that Sinatra (and Rails in the future =)
  # makes available for us. So in the case of a '/restaurants/12' path
  # params[:id] would have the value of 12
  # params[:id] => 12

  # We tell sinatra to render the
  # file at 'views/show.erb'
  erb :show
end

# Defines a path to where our view can send information the user typed in
# the form NOTICE that it's a POST, not a GET this time. We're going to
# see more about this in a future lecture.
post '/restaurants' do
  # We use the information the user typed in the form, available
  # through the special hash 'params', to create a new restaurant
  resto = Restaurant.create(
    name: params[:name],
    capacity: params[:capacity].to_i,
    address: params[:address]
  )

  # We then redirect the user to the show page of his newly
  # created restaurant
  redirect "/restaurants/#{resto.id}"
end
