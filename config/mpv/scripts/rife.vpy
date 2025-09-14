import vapoursynth as vs
from vapoursynth import core


# --- Performance Adjustments ---
core.num_threads = 12
rife_model = 0
detect_scene_change = True

# --- CRITICAL FIX: GPU SELECTION ---
# Your log shows the powerful dGPU is ID 0. We force RIFE to use it.
# [0 AMD Radeon Graphics (RADV GFX1200)]
gpu_to_use = 0
# --------------------------------

clip = video_in
clip = vs.core.resize.Bicubic(clip, format=vs.RGBS, matrix_in_s='709')

# Apply the RIFE filter with the correct GPU ID specified
clip = core.rife.RIFE(clip,
                     model=rife_model,
                     factor_num=2,
                     factor_den=1,
                     gpu_id=gpu_to_use, # <-- The critical new parameter
                     sc=detect_scene_change)

clip = vs.core.resize.Bicubic(clip, format=vs.YUV420P8, matrix_s='709')
clip.set_output()

