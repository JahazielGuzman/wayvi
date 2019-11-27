# Wayvi

Wayvi is a music streaming service where you can play your favorite songs from top artists and even create your own playlist with an account.

This is the backend written in Ruby on Rails connected to a Postgres database.

This repository is for the Rails backend, visit [here](https://github.com/JahazielGuzman/wayvi-frontend) for the front-end code base

[Click here for the hosted app.](http://wayvi.jahazielguzman.com) Rails app was deployed to Heroku.

This project was created in Rails, React and Postgres.

Some of the techniques used to create this app:
+ Stored user accounts, songs and playlists in PostgreSQL with Active Record.
+ Retrieved song metadata from Spotify API via the Rspotify gem.
+ Implemented user login with JWT tokens in LocalStorage.   

To run this project do the following:

Navigate to the folder where the project is contained and run

`bundle install`

`rails db:create`

`rails db:migrate`

`rails db:seed`

and finally

`rails s`
