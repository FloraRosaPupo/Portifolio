"""Encode fictional UI recordings as muted looping portfolio previews."""
import json,subprocess
from pathlib import Path
import imageio_ffmpeg
ffmpeg=imageio_ffmpeg.get_ffmpeg_exe()
timings=json.loads(Path('captures/ai-preview-timing.json').read_text())
for name, timing in timings.items():
 target=Path('web/previews')/(name+'.mp4')
 subprocess.run([ffmpeg,'-y','-ss',str(timing['start']),'-i',f'captures/{name}.webm','-t',str(timing['duration']),'-an','-vf','fps=12,scale=1080:750','-c:v','libx264','-preset','fast','-crf','25','-pix_fmt','yuv420p','-movflags','+faststart',str(target),'-loglevel','error'],check=True)
 print(name,target.stat().st_size,flush=True)
