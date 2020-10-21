# original segments
ffmpeg -i order1.mov -c:v libx264 -crf 22 -map 0 -segment_time 3 -g 3 -sc_threshold 0 -force_key_frames "expr:gte(t,n_forced*3)" -f segment order%03d.mov

ffmpeg -i order1.mov -c:v libx264 -crf 22 -map 0 -segment_time 200 -g 200 -sc_threshold 0 -force_key_frames "expr:gte(t,n_forced*3)" -f segment order%03d.mov

# Works:
ffmpeg -i "order1.mov" -c copy -map 0 -segment_time 00:05:00 -f segment -reset_timestamps 1  order%03d.mov

# Re-encoding: (doesnt work)
ffmpeg -i "order1.mov" -c:v libx264 -map 0 -segment_time 00:05:00 -f segment -reset_timestamps 1  order%03d.mov
$
  
  # Reencoding with crf specified
ffmpeg -i "order1.mov" -c:v libx264 -crf 18 -map 0 -segment_time 00:05:00 -f segment -reset_timestamps 1  order%03d.mov

# repeat for whole thing
ffmpeg -i "order1.mov" -c:v libx264 -crf 18 -map 0 -segment_time 00:00:03 -f segment -reset_timestamps 1  order%03d.mov

# removing reset timestamps
ffmpeg -i "order1.mov" -c:v libx264 -crf 18 -map 0 -segment_time 00:00:03 -f segment order%03d.mov      >>> made all screens go blank. so -reset_timestamps 1 is important

# using g200
ffmpeg -i "order1.mov" -c:v libx264 -crf 18 -map 0 -segment_time 3 -g 3 -f segment -reset_timestamps 1  order%03d.mov


# TRIALS

# order 1
ffmpeg -i "order1.mov" -c:v libx264 -crf 18 -map 0 -segment_time 3 -g 3 -f segment -reset_timestamps 1  order%03d.mov

# order 2
ffmpeg -i "order2.mov" -c:v libx264 -crf 18 -map 0 -segment_time 3 -g 3 -f segment -reset_timestamps 1  2slide_%03d.mov

# order 3
ffmpeg -i "order3.mov" -c:v libx264 -crf 18 -map 0 -segment_time 3 -g 3 -f segment -reset_timestamps 1  3slide_%03d.mov