"""Compõe as fotos de produto recortadas sobre o fundo dos cards (#C1BAB6), em 4:5, com sombra suave.
Uso: python compose.py [slug ...]   (sem args = todos os que tiverem recorte)"""
import os, sys
import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, '..', '..', '..', 'dist', 'media', 'colecao')
BG = (0xC1, 0xBA, 0xB6)          # mesmo taupe do .slot-wrap
W, H = 1080, 1350                # 4:5
FIT_W, FIT_H = 0.80, 0.72        # área máxima que a peça ocupa
CENTER_Y = 0.52

# peças fotografadas na mão: o braço sai pela base da foto; colamos rente à base do card (sem sombra no chão)
BLEED_BOTTOM = set()
SKIP = {'copo-amassado-vela'}   # card final gerado a partir de vela-ai.png (mão removida por IA)

def compose(slug):
    src = os.path.join(HERE, slug + '.png')
    cut = Image.open(src).convert('RGBA')
    a = np.asarray(cut)[:, :, 3]
    ys, xs = np.where(a > 10)
    cut = cut.crop((xs.min(), ys.min(), xs.max() + 1, ys.max() + 1))
    s = min(W * FIT_W / cut.width, H * FIT_H / cut.height)
    cut = cut.resize((max(1, round(cut.width * s)), max(1, round(cut.height * s))), Image.LANCZOS)
    # borda mais limpa: recua 1px o alfa e suaviza
    al = cut.getchannel('A').filter(ImageFilter.MinFilter(3)).filter(ImageFilter.GaussianBlur(0.8))
    cut.putalpha(al)

    canvas = Image.new('RGB', (W, H), BG)
    x = (W - cut.width) // 2
    y = int(H * CENTER_Y - cut.height / 2)
    if slug in BLEED_BOTTOM:
        s2 = min(W * 0.92 / cut.width, H * 0.95 / cut.height)
        cut = cut.resize((round(cut.width * s2), round(cut.height * s2)), Image.LANCZOS)
        al = cut.getchannel('A')
        x, y = (W - cut.width) // 2, H - cut.height + 2      # +2px: garante que a borda cortada fica fora do quadro
        out = os.path.join(OUT, slug, 'card.jpg')
        canvas.paste(cut, (x, y), cut)
        canvas.save(out, quality=90, optimize=True, progressive=True)
        print('ok', slug, '(bleed)', os.path.getsize(out) // 1024, 'KB')
        return

    def shadow(dx, dy, blur, opacity, squash=1.0):
        m = Image.new('L', (W, H), 0)
        sh = al.copy()
        if squash != 1.0:
            sh = sh.resize((sh.width, max(1, int(sh.height * squash))), Image.LANCZOS)
        m.paste(sh, (x + dx, y + dy + (cut.height - sh.height)))
        m = m.filter(ImageFilter.GaussianBlur(blur)).point(lambda v: int(v * opacity))
        return m

    dark = Image.new('RGB', (W, H), (70, 58, 50))
    for m in (shadow(int(W * 0.012), int(H * 0.030), H * 0.030, 0.30, 0.55),   # sombra ampla e suave, achatada no chão
              shadow(0, int(H * 0.004), H * 0.006, 0.28, 0.20)):                # contato apertado
        canvas.paste(dark, (0, 0), m)
    canvas.paste(cut, (x, y), cut)
    out = os.path.join(OUT, slug, 'card.jpg')
    canvas.save(out, quality=90, optimize=True, progressive=True)
    print('ok', slug, os.path.getsize(out) // 1024, 'KB')

if __name__ == '__main__':
    slugs = sys.argv[1:] or [f[:-4] for f in sorted(os.listdir(HERE)) if f.endswith('.png')]
    for s_ in slugs:
        if s_ in SKIP and not sys.argv[1:]: continue
        compose(s_)
