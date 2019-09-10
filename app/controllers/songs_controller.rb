class SongsController < ApplicationController

  def index
    @songs = Song.all
    songs = @songs.map { |song|
      {
        artist_name: song.artist.name,
        artist_id: song.artist.id,
        genre: song.genre,
        id: song.id,
        name: song.name,
        path: song.path,
        year: song.year
      }
    }
    render json: songs
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
