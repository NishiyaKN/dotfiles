import vapoursynth as vs
from vapoursynth import core

clip = video_in

# --- SAFETY BLOCK: Prevent Init Crash ---
src_fps = 23.976
if 'container_fps' in globals() and container_fps > 0.1:
    src_fps = container_fps

clip = core.std.AssumeFPS(clip, fpsnum=int(src_fps * 1000), fpsden=1000)

if clip.format.id != vs.YUV420P8:
    clip = core.resize.Point(clip, format=vs.YUV420P8)

# --- MONITOR SYNC LOGIC ---
# We try to detect your monitor refresh rate (display_fps).
# On a 100Hz screen, we want 100fps (smooth) or 50fps (perfect half-sync).
# 60fps on 100Hz causes stutter.
target_fps = 100  # Default to 100 if detection fails
if 'display_fps' in globals() and display_fps > 0:
    target_fps = display_fps

# If 100fps is too laggy for your CPU, uncomment the next line to force 50fps:
# target_fps = 50 

if clip.width > 1920 or clip.height > 1080 or src_fps > 59:
    clip.set_output()
else:
    # --- YOUR ORIGINAL "NICE" SETTINGS ---
    # We use your original single-pass search. No 'Recalculate' (wobbly lines).
    # We kept pel=4 because your GPU/CPU can handle it and it's sharper.
    super_ = core.mv.Super(clip, pel=4, hpad=16, vpad=16)
    
    bvec = core.mv.Analyse(super_, blksize=16, isb=True, chroma=True, search=4, overlap=8)
    fvec = core.mv.Analyse(super_, blksize=16, isb=False, chroma=True, search=4, overlap=8)

    # --- THE GHOSTING FIX ---
    # mask=1: The only change from your original. 
    # It hides the "transparent ghost" without melting the face.
    clip = core.mv.FlowFPS(
        clip, super_, bvec, fvec, 
        num=int(target_fps * 1000), den=1000, 
        mask=1, 
        thscd1=60, thscd2=70
    )

    clip.set_output()
