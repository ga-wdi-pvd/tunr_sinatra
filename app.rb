require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'
# Load specific routes / controllers

# Load models
require_relative 'models/artist'
require_relative 'models/song'

####################
#  General routes  #
####################

# get all artists
get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end

get "/artists/new" do
  erb :"artists/new"
end

#get info for a single artists
get "/artists/:id" do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

post "/artists" do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end
