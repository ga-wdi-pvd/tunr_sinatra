require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative "db/connection"

# Load models
require_relative "models/artist"
require_relative "models/song"

get "/" do
  # @first_names = first_names
  erb :index
end

get "/artists/new" do
  erb :"artists/new"
end

get "/artists/:id/edit" do
  @artists = Artist.find(params[:id])
  erb :"artists/edit"
end
get "/artists/:id/delete" do
  @artists = Artist.find(params[:id])
  erb :"artists/delete"
end

put "/artists/:id" do
  @artists = Artist.find(params[:id])
  @artists.update(params[:artist])
  redirect "/artists/#{@artists.id}"
end

get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end

get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/songs/:id" do
  @songs = Song.find(params[:id])
  @artists = Artist.find(@songs.artist_id)
  erb :"songs/show"
end

get "/artists/:id" do
  @artists = Artist.find(params[:id])
  @songs = Song.where(artist_id: params[:id])
  erb :"artists/show"
end

post "/artists" do
  @artists = Artist.create(params[:artist])
  redirect "/artists/#{@artists.id}"
end

delete "/artists/:id" do
  @artists = Artist.find(params[:id])
  @artists.destroy
  redirect "/artists"
end
