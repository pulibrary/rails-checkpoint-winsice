# Playlist Share Platform Database

## Account Table

This will hold information about each user's account for login purposes.

username: text \
password: text - hashed for security purposes

## Playlist Table

This will hold information about each playlist, including who made it, the name, category it fits under, a link to the playlist that will redirect you to the music streaming service, and amount of listens it receives. 

playlist_id: int \
account_id: int \
playlist_name: text \
category: text \
playlist_link: text \
amount_of_listens: int

## Song Table

This will hold information about all the songs in a playlist, including the artist. 

playlist_id: int \
song_name: text \
artist: text 

## Example Queries

### EX 1: Finding the top 10 most popular classical playlists

SELECT playlist_name FROM Albums WHERE category = “Classical” ORDER BY DESC LIMIT 10;

### EX 2: Finding all the playlists a specific user uploaded 

SELECT playlist_name FROM Albums WHERE username = “user1”; 

### EX 3: Look at what’s in a specific playlist 

SELECT song_name, artist FROM Songs WHERE playlist_id = “2”;
