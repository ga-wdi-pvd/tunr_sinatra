require "sinatra"
require "sinatra/reloader"
require "active_record"
require 'pry'

# Load the file to connect to the DB
require_relative "db/connection"
# Load models
require_relative "models/artist"
require_relative "models/song"

get '/artist' do
  @artist = Artist.all
  erb :"artist/index"
end

get "/artist/new" do
  erb :"artist/new"
end

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb :"artist/show"
end

post "/artists" do
  @artist = Artist.create(params[:artist])
  redirect "/artist/#{@artist.id}"
end

get "/artist/edit" do
  binding.pry
 # @artist =
end

get "artist/delete" do
  # @artist =
end
