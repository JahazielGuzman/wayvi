# Wayvi

Wayvi is a music streaming service where you can play your favorite songs from top artists and even create your own playlist with an account.

This repository is for the Rails backend, visit [here](https://github.com/JahazielGuzman/wayvi-frontend) for the front-end code base

[Click here for the hosted app.](http://wayvi.jahazielguzman.com) Rails app was deployed to Heroku.

Some of the techniques used to create this app:
+ Stored user accounts, songs and playlists in PostgreSQL with Active Record.
+ Retrieved song metadata from Spotify API via the Rspotify gem.
+ Implemented user login with JWT tokens in LocalStorage.

### How to run

1. cd to project directory

2. `bundle install`

3. `rails db:create`

4. `rails db:migrate`

5. `rails db:seed`

and finally

6. `rails s`

### Built With
* Ruby on Rails
* React.js
* PostgreSQL
* ActiveRecord
* RSpotify Gem
