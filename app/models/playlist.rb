class Playlist < ApplicationRecord
  belongs_to :user
  has_many :song_list
  has_many :songs, through: :song_list
end
