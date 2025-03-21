#!/bin/zsh

if [ $# -ne 3 ]; then
  echo "Usage: $0 <input_video_file> <start_time> <end_time>"
  echo "Example: $0 vid.mp4 00:03 00:20"
  exit 1
fi

input_file=$1
start_time=00:$2
end_time=00:$3

echo "$start_time $end_time"

output_file="${input_file%.*}.gif"

ffmpeg -i "$input_file" -ss $start_time -to $end_time -vf "scale=500:500, fps=8" -c:v gif "$output_file"

echo "$output_file"
