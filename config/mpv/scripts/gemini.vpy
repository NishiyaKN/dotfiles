# vim: set ft=python:

import vapoursynth as vs
from vapoursynth import core
clip = video_in

if clip.width > 1920 or clip.height > 1080 or container_fps > 59:
    clip.set_output()
else:
    # dst_fps = display_fps
    dst_fps = 80
    clip = core.std.AssumeFPS(clip, fpsnum=int(container_fps * 1e8), fpsden=int(1e8))
    
    super_search = core.mv.Super(clip, pel=4, hpad=32, vpad=32)
    
    bvec = core.mv.Analyse(super_search, blksize=16, isb=True, chroma=True, search=5, overlap=8)
    fvec = core.mv.Analyse(super_search, blksize=16, isb=False, chroma=True, search=5, overlap=8)

    clip = core.mv.FlowFPS(clip, super_search, bvec, fvec, num=int(dst_fps), den=1, thscd1=60, thscd2=80)

    clip.set_output()
