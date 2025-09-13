import vapoursynth as vs
core = vs.get_core()
clip = video_in

# --- FIX for Black Screen ---
# The mvtools plugin often requires a specific pixel format.
# This line converts the video to a standard 8-bit YUV 4:2:0 format,
# which is highly compatible and a common fix for this issue.
clip = core.resize.Bicubic(clip, format=vs.YUV420P8, matrix_s="709")

# Set your monitor's refresh rate here
TARGET_FPS_NUM = 100  # Target framerate (e.g., 100, 60)
TARGET_FPS_DEN = 1    # Denominator, usually 1

# Analyze motion vectors
super = core.mv.Super(clip, pel=2)
bvec = core.mv.Analyse(super, isb=True, delta=1, overlap=4)
fvec = core.mv.Analyse(super, isb=False, delta=1, overlap=4)

# Synthesize new frames to match the target framerate
final_clip = core.mv.BlockFPS(clip, super, bvec, fvec, num=TARGET_FPS_NUM, den=TARGET_FPS_DEN)

final_clip.set_output()
