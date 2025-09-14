# vim: set ft=python:
# The ULTIMATE script. Uses quarter-pixel precision for the most accurate motion analysis possible.

import vapoursynth as vs
from vapoursynth import core
clip = video_in

if clip.width > 1920 or clip.height > 1080 or container_fps > 59:
    clip.set_output()
else:
    # dst_fps = display_fps
    dst_fps = 60
    clip = core.std.AssumeFPS(clip, fpsnum=int(container_fps * 1e8), fpsden=int(1e8))
    
    # --- FINAL, ULTIMATE UPGRADE: Quarter-Pixel Precision ---
    # pel=4 provides the most accurate motion analysis possible with mvtools.
    # This is extremely CPU-intensive.
    super_search = core.mv.Super(clip, pel=4, hpad=16, vpad=16)
    
    # The rest of the analysis uses our best settings from the 'Elite' script.
    bvec = core.mv.Analyse(super_search, blksize=8, isb=True, chroma=True, search=4, overlap=4)
    fvec = core.mv.Analyse(super_search, blksize=8, isb=False, chroma=True, search=4, overlap=4)

    # We use the superior FlowFPS rendering method.
    clip = core.mv.FlowFPS(clip, super_search, bvec, fvec, num=int(dst_fps), den=1, thscd1=80, thscd2=128)

    clip.set_output()
