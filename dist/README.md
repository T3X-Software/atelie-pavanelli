# Ateliê Pavanelli — Landing Page

Pasta pronta para deploy estático.

## Deploy no Vercel

**Opção 1 — Arrastar para o Vercel (mais rápido)**
1. Acesse https://vercel.com/new
2. Arraste esta pasta `dist/` para a área de upload
3. Confirme as configurações (preset: *Other*, build command vazio)
4. Clique em **Deploy**
5. Em ~30s você terá uma URL `https://<projeto>.vercel.app` para enviar ao cliente

**Opção 2 — Linha de comando**
```bash
npm i -g vercel
cd dist
vercel --prod
```

## Estrutura

```
dist/
├── index.html       # Página única, imagens embutidas
├── media/
│   └── processo.mp4 # Vídeo do processo (autoplay muted loop)
└── vercel.json      # Cache headers para o vídeo
```

Tudo self-contained — sem dependências externas além do Google Fonts.

## Após o deploy

- Configure um domínio próprio em **Settings → Domains** (ex: `ateliepavanelli.com.br`)
- Para atualizar imagens ou textos, edite o `index.html` e faça redeploy
