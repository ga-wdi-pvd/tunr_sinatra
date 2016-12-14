require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/artist' do
  @artist = Artist.all
  erb :'/artists/index'
end

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb :'/artists/show'
end

post '/add_new' do
  @artist = Artist.all
  name << params[:name]
  nationality << params[:nationality]
  redirect '/artist/index'
  erb :'/artists/add_new'
end
