#!/bin/bash

# use curl or wget to download

curl -o birdwatch-public-data-2025-06-16-notes.gz https://ton.twimg.com/birdwatch-public-data/2025/06/16/notes/notes-00000.zip

# update the timestamp on the resulting file using touch
# do not remove, this will avoid re-downloading of the data once you have it
touch birdwatch-public-data-2025-06-16-notes.gz