#!/bin/bash

# Get the current city using IP geolocation
CITY=$(curl -s https://ipinfo.io/city 2>/dev/null)

# Check if CITY is retrieved successfully
if [[ -n "$CITY" ]]; then
    # Fetch weather info for the detected city from wttr.in
    weather_info=$(curl -s "wttr.in/$CITY?format=%c+%C+%t" 2>/dev/null)

    # Check if the weather info is valid
    if [[ -n "$weather_info" ]]; then
        echo "▼ $CITY: $weather_info"
    else
        echo "Weather info unavailable for $CITY"
    fi
else
    echo "Unable to determine your location"
fi
