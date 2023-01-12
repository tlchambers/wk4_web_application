# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/albums' do
    album_repo = AlbumRepository.new
    all_albums = album_repo.all
    response = all_albums.map { |album| album.title }

    return response.join(', ')
  end

  post ('/albums') do
    album_repo = AlbumRepository.new
    new_album = Album.new
    new_album.title = params[:title]
    new_album.release_year = params[:release_year]
    new_album.artist_id = params[:artist_id]

    album_repo.create(new_album)

    return ''
  end

  get '/artists' do
    artist_repo = ArtistRepository.new
    all_artists = artist_repo.all
  
    response = all_artists.map {|artist| artist.name}.join(', ')
    return response
  end

  post '/artists' do
    artist_repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.name =  params[:name]
    new_artist.genre = params[:genre]

    return ''
  end
end