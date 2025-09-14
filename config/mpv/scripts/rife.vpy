import vapoursynth as vs
from vapoursynth import core

# Increase the number of threads for VapourSynth.
# Adjust this based on your CPU core count. A good starting point is half the number of your CPU threads.
core.num_threads = 6

# Load the video input from mpv.
clip = video_in

# It's recommended to convert the video to RGB for RIFE processing.
clip = vs.core.resize.Bicubic(clip, format=vs.RGBS, matrix_in_s='709')

# Apply the RIFE filter.
# model=3 is generally a good choice for anime.
# factor_num=2 and factor_den=1 will double the frame rate (e.g., 24fps to 48fps).
# For 60fps from 24fps, you can use factor_num=5 and factor_den=2.
# However, for real-time playback, a simple doubling is more likely to be achievable.
# Your powerful GPU might handle higher factors.
clip = core.rife.RIFE(clip, model=3, factor_num=2, factor_den=1)

# Convert the video back to YUV format for playback.
clip = vs.core.resize.Bicubic(clip, format=vs.YUV420P10, matrix_s='709')

# Output the processed video.
clip.set_output()
