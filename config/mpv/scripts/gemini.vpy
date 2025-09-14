# vim: set ft=python:
# A script focused on reducing blocky artifacts while maintaining good performance.

import vapoursynth as vs
from vapoursynth import core
clip = video_in

if clip.width > 1920 or clip.height > 1080 or container_fps > 59:
    clip.set_output()
else:
    dst_fps = display_fps
    clip = core.std.AssumeFPS(clip, fpsnum=int(container_fps * 1e8), fpsden=int(1e8))
    
    # --- Tuning ---
    # We keep the fast blksize=16.
    # We add ONLY the overlap parameter to smooth out block edges.
    super_search = core.mv.Super(clip, pel=2, hpad=16, vpad=16)
    bvec = core.mv.Analyse(super_search, blksize=16, isb=True, chroma=True, search=3, overlap=4)
    fvec = core.mv.Analyse(super_search, blksize=16, isb=False, chroma=True, search=3, overlap=4)

    clip = core.mv.BlockFPS(clip, super_search, bvec, fvec, num=int(dst_fps), den=1, mode=3, thscd1=80, thscd2=128)

    clip.set_output()
