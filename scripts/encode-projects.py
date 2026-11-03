"""Encode recorded app flows. Requires imageio-ffmpeg; run from repo root."""
import subprocess
from pathlib import Path
import imageio_ffmpeg

ffmpeg = imageio_ffmpeg.get_ffmpeg_exe()
out = Path('web/previews')
out.mkdir(parents=True, exist_ok=True)
for name, start in [('repomentor', 0), ('triagem', 1.5)]:
    source = ['-ss', str(start), '-i', f'captures/{name}.webm']
    subprocess.run([
        ffmpeg, '-y', *source, '-an', '-vf', 'fps=12,scale=1080:750',
        '-c:v', 'libx264', '-preset', 'fast', '-crf', '26',
        '-pix_fmt', 'yuv420p', '-movflags', '+faststart',
        str(out / f'{name}.mp4'), '-loglevel', 'error',
    ], check=True)
    subprocess.run([
        ffmpeg, '-y', '-i', str(out / f'{name}.mp4'),
        '-filter_complex',
        'fps=8,scale=720:500:flags=lanczos,split[a][b];'
        '[a]palettegen=max_colors=128[p];[b][p]paletteuse=dither=bayer',
        '-loop', '0', str(out / f'{name}.gif'), '-loglevel', 'error',
    ], check=True)
    print(f'Encoded {name}', flush=True)
