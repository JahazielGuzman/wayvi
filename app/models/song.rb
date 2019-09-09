class Song < ApplicationRecord
  belongs_to :artist
  has_many :song_list
  has_many :playlists, through: :song_list
end
