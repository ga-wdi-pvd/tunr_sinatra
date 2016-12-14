require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/artist'
require_relative 'models/song'

get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end

get "/artists/new" do
  erb :"artists/new"
end

get "/artists/:id" do
  @artist= Artist.find(params[:id])
  erb :"artists/show"
end

post "/artists" do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get "/artists/:id/edit" do
  @artist= Artist.find(params[:id])
  erb :"artists/edit"
end

put "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect "/artists/#{@artist.id}"
end

delete "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect "/artists"
end
