# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artist.destroy_all
Playlist.destroy_all
Song.destroy_all
SongList.destroy_all


user1 = User.create(username: 'peter', password_digest: 'peterpass', name: 'Peter', city: 'New York City')
artist1 = Artist.create(name: 'Imagine Dragons', age: 2, genre: 'Pop Rock')
playlist1 = Playlist.create(name: 'Favorites', user_id: user1.id)
song1 = Song.create(name: 'Natural', year: '2019', genre: 'Pop Rock', path: 'kbhdefhbdjhuid', artist_id: artist1.id)
songlist1 = SongList.create(playlist_id: playlist1.id, song_id: song1.id)
