"""Recorta os círculos das fotos geradas (row1..3), ajusta a cor média ao hex do esmalte e exporta webp 272px.
Os 7 primeiros vêm dos recortes do print de referência (ref-*.png), sem correção de cor."""
import os, sys
import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, '..', '..', '..', 'dist', 'media', 'cores')
S = 272
os.makedirs(OUT, exist_ok=True)

REF = ['branco', 'marfim', 'mostarda', 'chocolate', 'azul-bebe', 'azul-piscina', 'azul-turquesa']
ROWS = {
    'row1': [('azul-hortensia', '#9BAED4'), ('azul-anil', '#34488F'), ('azul-mirtilo', '#3B3B6B'), ('azul-agua', '#A7C9C7'), ('verde-esmeralda', '#2E8B6B')],
    'row2': [('verde-bandeira', '#1E7A3D'), ('verde-petroleo', '#2E5B5B'), ('verde-erva-doce', '#A7B96A'), ('cinza-gris', '#8A8A80'), ('rosa-salmao', '#E8A89A')],
    'row3': [('laranja-godiva', '#D9772E'), ('rosa-figo', '#B5707A'), ('roxo-malva', '#9B7FA6'), ('verde-alga', '#8AA37B'), ('preto', '#2B2B2B')],
}
# quanto da diferença de cor média (0..1) é corrigida; 1 = cor média exatamente no hex
CORRECT = float(os.environ.get('CORRECT', '0.7'))

def hex2rgb(h): return np.array([int(h[i:i + 2], 16) for i in (1, 3, 5)], dtype=float)

def circles(img):
    a = np.asarray(img.convert('RGB')).astype(float)
    h, w, _ = a.shape
    bg = np.median(np.concatenate([a[:12].reshape(-1, 3), a[-12:].reshape(-1, 3)]), axis=0)
    d = np.abs(a - bg).sum(axis=2)
    m = d > 26
    cols = m.sum(axis=0) > h * 0.05
    segs, st = [], None
    for x, v in enumerate(cols):
        if v and st is None: st = x
        if not v and st is not None:
            if x - st > w * 0.06: segs.append((st, x))
            st = None
    if st is not None and w - st > w * 0.06: segs.append((st, w))
    out = []
    for x0, x1 in segs:
        ys = np.where(m[:, x0:x1].sum(axis=1) > (x1 - x0) * 0.05)[0]
        y0, y1 = ys.min(), ys.max() + 1
        out.append(((x0 + x1) / 2, (y0 + y1) / 2, ((x1 - x0) + (y1 - y0)) / 4))
    return out

def tune(im, target):
    a = np.asarray(im.convert('RGB')).astype(float)
    yy, xx = np.mgrid[:S, :S]
    inner = ((xx - S / 2) ** 2 + (yy - S / 2) ** 2) < (S * 0.42) ** 2
    mean = a[inner].mean(axis=0)
    gain = np.clip(target / np.maximum(mean, 1), 0.55, 1.8)
    gain = 1 + (gain - 1) * CORRECT
    a = np.clip(a * gain, 0, 255)
    return Image.fromarray(a.astype('uint8'))

def save(im, slug):
    p = os.path.join(OUT, slug + '.webp')
    im.save(p, quality=88, method=6)
    print('ok', slug, os.path.getsize(p) // 1024, 'KB')

for n in REF:
    save(Image.open(os.path.join(HERE, f'ref-{n}.png')).convert('RGB'), n)

for row, items in ROWS.items():
    p = os.path.join(HERE, row + '.png')
    if not os.path.exists(p):
        print('sem', row); continue
    img = Image.open(p).convert('RGB')
    cs = circles(img)
    print(row, 'círculos detectados:', len(cs), [(round(x), round(y), round(r)) for x, y, r in cs])
    if len(cs) != len(items):
        print('  !! esperado', len(items)); continue
    for (cx, cy, r), (slug, hx) in zip(cs, items):
        R = r * 0.97
        crop = img.crop((int(cx - R), int(cy - R), int(cx + R), int(cy + R))).resize((S, S), Image.LANCZOS)
        save(tune(crop, hex2rgb(hx)), slug)
