#### Preamble ####
# Purpose: Downloading data about spotify artists 'Her' using spotify API. 
# Author: Shamayla Durrin
# Date: 9 October 2024
# Contact: shamayla.islam@mail.utoronto.ca
# License: MIT
# Pre-requisites: N.A
# Any other information needed? N.A

# Load necessary libraries
library(spotifyr)
library(dplyr)
library(usethis)

# Authenticating R session with Spotify's API

spotifyr::get_spotify_access_token()

# Dowloading Data for artist: Hers

hers <- get_artist_audio_features("her's") # Downloading audio features for the band her's 

saveRDS(hers, "data/hers.rds") # Saving the Data 

# Downloading Data for artist: Her
# For this artist the get_artist_audio_features gives and error so we have to do it manually. 

her_albums <- get_artist_albums("1T2WeXEi0XlZiPpjjDAY0L") # Step 1: Get albums for the artist with the correct ID
her_tracks <- lapply(her_albums$id, get_album_tracks) # Step 2: Get all tracks for each album
her_tracks <- bind_rows(her_tracks)
her <- get_track_audio_features(her_tracks$id) # Step 3: Fetch audio features for all tracks
saveRDS(her, "data/her.rds")



