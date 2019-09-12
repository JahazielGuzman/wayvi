class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
    render json: @playlists
  end

  def show
    @playlist = Playlist.all.find(params[:id])
    render json: @playlist.songs
  end

  def create
    @playlist = Playlist.create(playlist_params)
    render json: @playlist
  end

  def update
    @playlist = Playlist.all.find(params[:id])
    @playlist.update(playlist_params)
    render json: @playlist
  end

  def delete
    @playlist = Playlist.all.find(params[:id])
    @playlist.destroy
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end

end
