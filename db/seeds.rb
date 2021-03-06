# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rspotify'

User.destroy_all
Artist.destroy_all
Playlist.destroy_all
SongList.destroy_all
Song.destroy_all

artists = [
  "Ke$ha",
  "SWV", 
  "6lack",
  "Imagine Dragons",
  "Drake",
  "Beyonce",
  "Faith Hill",
  "J Balvin",
  "Maroon 5",
  "Zedd",
  "Bruno Mars",
  "Maluma",
  "Jodeci",
  "Willie Nelson",
  "Daddy Yankee",
  "Luis Miguel",
  "Cristian Castro",
  "Wisin & Yandel",
  "Rihanna",
  "Madonna",
  "Jay-Z",
  "50 Cent",
  "Lil Wayne",
  "Green Day",
  "Good Charlotte",
  "Britney SPears",
  "Christina Aguilera",
  "Guns & Roses",
  "Led Zeppelin",
  "Mary J Blige"
]
genres = [
  "Pop",
  "R & B",
  "R & B",
  "Pop",
  "Hip Hop",
  "R & B",
  "Country",
  "Reggaeton","Pop",
  "EDM",
  "Pop",
  "Reggaeton",
  "R & B",
  "Country",
  "Reggaeton",
  "Latin Pop",
  "Latin Pop",
  "Reggaeton",
  "Pop",
  "Pop",
  "Hip Hop",
  "Hip Hop",
  "Hip Hop",
  "Rock",
  "Rock",
  "Pop",
  "Pop",
  "Rock",
  "Rock",
  "R & B"
]

RSpotify.authenticate(ENV['client_id'],ENV['client_secret'])
for i in 0...artists.length do

  artist = RSpotify::Artist.search(artists[i]).first
  track_arr = artist.top_tracks("US")
  artist = Artist.create(
    name: artist.name,
    genre: genres[i],
    popularity: artist.popularity
  )
  track_arr.each do |t|
    sleep(1)
    if (t.preview_url)
      Song.create(
        name: t.name,
        year: t.album.release_date.split('-').first,
        genre: genres[i],
        path: t.preview_url,
        artist: artist,
        artist_name: artist.name,
        image: t.album.images[t.album.images.length - 2]["url"]
      )
    end
  end

end

user1 = User.create(username: 'peter', password: 'peterpass', name: 'Peter')
playlist1 = Playlist.create(name: 'Favorites', user_id: user1.id)
songlist1 = SongList.create(playlist_id: playlist1.id, song_id: Song.all.sample.id)
