class SongsController < ApplicationController

  def index
    @songs = Song.all
    render json: @songs
  end

  def create
    @song = Song.create(song_params)
    render json: @song
  end

  private

  def song_params
    params.require(:song).permit(:name, :year, :genre, :path, :artist_id)
  end

end
