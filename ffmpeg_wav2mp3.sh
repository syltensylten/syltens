"ffmpeg -f wav -i audio/taget.wav -t 00:05:44 -af "afade=t=out:st=300:d=10" -acodec libmp3lame -ab 192k -ar 44100 audio/taget.mp3" 
