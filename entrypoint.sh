#!/bin/bash

google-chrome-stable --headless --disable-gpu --remote-debuggin-address=0.0.0.0 --remote-debugging-port=9222 & 
sleep 3
cd /chromeshot
node index.js $@
