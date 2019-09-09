class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    render json: @artists
  end

  def create
    @artist = Artist.create(artist_params)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :genre, :age)
  end

end
