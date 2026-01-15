import vapoursynth as vs
from vapoursynth import core

clip = video_in

# 1. Enforce YUV420P8 format. 
# This decouples the script from the raw hardware decoder input momentarily
# and often prevents the "Frame requested during init" error.
if clip.format.id != vs.YUV420P8:
    # Use Point resize for zero-impact format casting if dimensions match
    clip = core.resize.Point(clip, format=vs.YUV420P8)

# 2. Safety check for FPS to prevent math errors if mpv reports 0 or None
src_fps = container_fps if (container_fps and container_fps > 0.1) else 23.976

# 3. Resolution and FPS limit check
if clip.width > 1920 or clip.height > 1080 or src_fps > 59:
    clip.set_output()
else:
    dst_fps = 60
    # Use standard scaling logic
    clip = core.std.AssumeFPS(clip, fpsnum=int(src_fps * 1000), fpsden=1000)
    
    super_search = core.mv.Super(clip, pel=4, hpad=32, vpad=32)
    
    bvec = core.mv.Analyse(super_search, blksize=16, isb=True, chroma=True, search=4, overlap=8)
    fvec = core.mv.Analyse(super_search, blksize=16, isb=False, chroma=True, search=4, overlap=8)

    clip = core.mv.FlowFPS(clip, super_search, bvec, fvec, num=int(dst_fps), den=1, thscd1=60, thscd2=70)

    clip.set_output()
