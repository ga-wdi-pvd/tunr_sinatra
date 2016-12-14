require "sinatra"
require "sinatra/reloader"
require "active_record"

# Load the file to connect to the DB
require_relative "db/connection"

# Load models
require_relative "models/artist"
require_relative "models/song"


get "/" do
  @first_names = first_names
  erb :index
end

post "/add_name" do
  first_names << params[:first_name]
  redirect "/"
end

get "/artists/new" do
  erb :"artists/new"
end

post "/artists" do
  @instructor = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end
get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/artists/:id" do
  @artists = Artist.find(params[:id])
  erb :"artists/show"
end
