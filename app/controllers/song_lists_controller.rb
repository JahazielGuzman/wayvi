class SongListsController < ApplicationController

  def index
    @songlists = SongList.all.map do |songlist|
      {
        songlist: songlist,
        song: songlist.song,
        playlist: songlist.playlist
      }
    end
    render json: @songlists
  end

  def show
    playlist = Playlist.find(params[:id])
    render json: playlist.songs
  end

  def create
    @songlist = SongList.create(songlist_params)
    @songlists = SongList.all.map do |songlist|
      {
        songlist: songlist,
        song: songlist.song,
        playlist: songlist.playlist
      }
    end
    @foundSongList = @songlists.find do |songlist|
      songlist[:songlist].id === @songlist.id
    end
    render json: @foundSongList
  end

  private

  def songlist_params
    params.require(:song_list).permit(:playlist_id, :song_id)
  end

end
