import vapoursynth as vs
import math
from vsrife import rife # Import the RIFE function from the new plugin

from vapoursynth import core
clip = video_in

# VFR safety check
if clip.fps_den == 0:
    clip = core.std.AssumeFPS(clip, fpsnum=24000, fpsden=1001)

# Configuration
TARGET_FPS = 60
FPS_THRESHOLD = 40

# --- Call the new ncnn-vulkan RIFE plugin ---
if clip.fps_num / clip.fps_den < FPS_THRESHOLD:
    # This plugin handles the frame doubling automatically to reach the target.
    # We just need to tell it the target numerator and denominator.
    clip = core.rife.RIFE(
        clip,
        fpsnum=TARGET_FPS,
        fpsden=1,
        model=4, # Corresponds to RIFE v4.6
        gpu_id=0,
        gpu_thread=2
    )
    
clip.set_output()
