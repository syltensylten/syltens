#!/bin/bash

# Ensure you have the correct number of arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <input.wav>"
    exit 1
fi

read -p "Wavefile: "

input_file=$1
output_file="${input_file%.wav}.mp3"

file_length=$(ffmpeg -i "$input_file" 2>&1 | grep "Duration" | awk '{print $2}' | tr -d ',' | cut -d '.' -f 1)


read -p "Enter fade duration (seconds, default is 3): " fade_duration

if [ -z "$fade_duration" ]; then
	fade_duration=3

read -p "Enter fade start (seconds, default is 3): " fade_start_time

i# Ensure fade start time is within the file length
if [ "$fade_start_time" -gt "$file_length" ]; then
    echo "Fade start time cannot be greater than the file length ($file_length seconds). Setting fade start time to $((file_length - fade_duration))"
    fade_start_time=$((file_length - fade_duration))
fi

# Convert WAV to MP3 with fade-out effect using FFmpeg
ffmpeg -i "$input_file" -af "afade=t=out:st=$fade_start_time:d=$fade_duration" -acodec libmp3lame -ab 192k -ar 44100 "$output_file"

if [ $? -eq 0 ]; then
    echo "Conversion complete: $output_file"
else
    echo "An error occurred during conversion."
    exit 1
fi
