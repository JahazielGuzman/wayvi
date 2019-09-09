class SongListsController < ApplicationController

  def index
    @songlists = SongList.all
    render json: @songlists
  end

  def create
    @songlist = SongList.create(songlist_params)
  end

  private

  def songlist_params
    params.require(:songlist).permit(:playlist_id, :song_id)
  end

end
