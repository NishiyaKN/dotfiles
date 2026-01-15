import vapoursynth as vs
from vapoursynth import core
import os

clip = video_in

# --- SAFETY BLOCK ---
src_fps = 23.976
if 'container_fps' in globals() and container_fps > 0.1:
    src_fps = container_fps

clip = core.std.AssumeFPS(clip, fpsnum=int(src_fps * 1000), fpsden=1000)

if clip.format.id != vs.YUV420P8:
    clip = core.resize.Point(clip, format=vs.YUV420P8)

# --- SPEED OPTIMIZATION (720p + Bilinear) ---
# We use Bilinear because it is faster than Bicubic.
# Anime4K will handle the sharpness later, so we don't need expensive resizing here.
if clip.width > 1280:
    clip = core.resize.Bilinear(clip, width=1280, height=720)

# --- RIFE CONFIG ---
clip = core.resize.Bilinear(clip, format=vs.RGBS, matrix_in_s="709")

model_path = os.path.expanduser("~/.config/mpv/models/rife-v4.6")

clip = core.rife.RIFE(
    clip, 
    model_path=model_path, 
    gpu_id=0,          
    gpu_thread=2,      
    sc=True,           
    factor_num=2,      
    factor_den=1
)

# Convert back to YUV
clip = core.resize.Bilinear(clip, format=vs.YUV420P8, matrix_s="709")

clip.set_output()
