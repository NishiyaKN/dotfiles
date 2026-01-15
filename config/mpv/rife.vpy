import vapoursynth as vs
from vapoursynth import core
import vsrife

clip = video_in

# Standard Safety
src_fps = 23.976
if 'container_fps' in globals() and container_fps > 0.1:
    src_fps = container_fps
    
clip = core.std.AssumeFPS(clip, fpsnum=int(src_fps * 1000), fpsden=1000)

if clip.format.id != vs.YUV420P8:
    clip = core.resize.Point(clip, format=vs.YUV420P8)

# RIFE needs RGB, but vs-rife handles conversion internally usually.
# Just to be safe, let's keep it simple.
if clip.width > 1920 or clip.height > 1080 or src_fps > 59:
    clip.set_output()
else:
    # Use GPU AI to double the framerate (approx 48 -> 96, or 24 -> 48)
    # factor_num=2, factor_den=1 doubles the FPS.
    # To hit exactly 50fps from 24 is hard for AI (it likes 2x, 4x).
    # 2x = 48fps. This is very close to 50 and looks great on 100Hz.
    clip = core.resize.Bicubic(clip, format=vs.RGBS)
    clip = vsrife.RIFE(clip, model_ver=4.6, factor_num=2, factor_den=1)
    clip = core.resize.Bicubic(clip, format=vs.YUV420P8, matrix_s="709")
    
    clip.set_output()
