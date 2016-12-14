require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'models/artist'
require_relative 'models/song'
require_relative 'db/connection'

# Load the file to connect to the DB

# Load specific routes / controllers
get '/artists' do
  @artist = Artist.all
  erb :'artists/index'
end

get "/artists/new" do
  erb :"artists/new"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :'artists/show'
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :'/artists/edit'
end

put "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect to ("/artists/#{@artist.id}")
end

delete "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect "/artists"
end

get '/songs' do
  @song = Song.all
  erb :'/songs/index'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @artist = Artist.find( @song.artist_id )
  erb :'/songs/show'
end
