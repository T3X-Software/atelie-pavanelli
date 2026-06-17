# Planejamento de ajustes — LP Ateliê Pavanelli (rev 17/06/2026)

Baseado no material novo enviado pela Letícia em `rev/17062026/` e no estado atual da LP
(`dist/index.html` — página única, imagens já externalizadas em `dist/media/`).

> Este documento dá continuidade ao `rev/04062026/PLANO.md`. A rev de 04/06 já foi aplicada e está
> no ar (capa nova, 6 fotos da coleção, seção "Sobre as peças/Cuidados", paleta de 22 esmaltes).
> Agora a Letícia mandou **as fotos oficiais e os nomes corretos das peças**, além de novas
> referências de capa/layout.

---

## 1. O que veio de novo na pasta `rev/17062026/`

| Item | Conteúdo | O que significa |
|------|----------|-----------------|
| `coleção/` (11 subpastas nomeadas) | Fotos oficiais por peça, **fundo branco uniforme**, com o **nome correto de cada produto** na pasta | Substitui a coleção atual (cujos nomes eu "chutei") pelos **nomes e fotos definitivos** |
| `prima-capa.png` | Print do site **pripa.com.br** ("PETIT BOBÔ") — canecas coloridas agrupadas sobre blocos de cor | **Referência de estilo** de capa/hero (não é uma imagem para usar direto) |
| `WhatsApp ...14.37.04.jpeg` | Print do **site atual no ar** com o **hero circulado em verde** | Marcação da Letícia apontando a área do hero |
| `WhatsApp ...15.02.02.jpeg` | Print do site atual com o **cabeçalho da coleção circulado em verde** ("Peças para uma mesa que respira" + texto lateral) | Marcação da Letícia apontando o topo da seção Coleção |
| `melhorias.md` | Mesmo texto da rev 04/06 (cores, descrição padrão, refs) | Já aplicado na rev anterior — sem novidade |

---

## 2. Catálogo oficial das peças (pasta `coleção/`)

Todas com fundo branco/claro uniforme e ótima qualidade — prontas para a coleção.

| # | Nome oficial (pasta) | Foto / descrição | Cor predominante p/ a tag |
|---|----------------------|------------------|---------------------------|
| 1 | **Caneca personalizada** | 15 fotos — várias cores e nomes gravados na base (ex.: "LUCAS" verde-musgo, azul, preto, rosa, marrom) | Várias · Personalizável |
| 2 | **Xícara e pires** | Jogo espresso azul anil, base natural, "personalizado" no pires (3 fotos) | Azul anil · Personalizável |
| 3 | **Xícara gota** | Par de copos/bowls em formato "gota", verde petróleo fosco (3 fotos) | Verde petróleo |
| 4 | **Conjunto japonês** | Prato retangular + molheira preto salpicado + hashi (2 fotos) | Preto |
| 5 | **Porta-joias** | Bandejinhas brancas salpicadas com frase gravada ("1 Coríntios 13") (3 fotos) | Branco · Personalizável |
| 6 | **Porta-pincéis** | Potinho rosa salpicado com bolinhas em relevo (1 foto) | Rosa salmão |
| 7 | **Bowl com compartimento para molho** | Bowl branco salpicado com cavidade pequena lateral (3 fotos) | Branco |
| 8 | **Tábua para petiscos** | Travessa orgânica branca/marfim com relevos (5 fotos) | Marfim |
| 9 | **Saladeira grande** | Bowl grande, interior azul petróleo, base natural (2 fotos) | Azul petróleo |
| 10 | **Prato sobremesa** | Par de pratos mostarda/laranja godiva salpicado (1 foto) | Mostarda |
| 11 | **Prato grande** | Par de pratos azul água/turquesa salpicado (3 fotos) | Azul água |

> São **11 peças** (a rev anterior tinha só 6 cards, com nomes provisórios). A grade da coleção
> hoje é de 3 colunas — 11 peças cabem bem (4 linhas: 3+3+3+2), ou podemos curar para 9 (grade
> 3×3 cheia). **A confirmar com a cliente.**

---

## 3. Mudanças propostas (por seção)

### 3.1 Coleção — trocar pelos nomes/fotos oficiais  ✅ ação principal
- Para cada peça: escolher a **melhor foto** da pasta, recortar/otimizar para o slot 4:5 e salvar em
  `dist/media/colecao/<slug>.jpg` (ex.: `caneca-personalizada.jpg`, `xicara-gota.jpg`).
- Reescrever os `article.product-card` com **nome oficial**, **tag de cor correta** (o "dot") e
  `alt` adequado.
- Definir quantos cards exibir (6, 9 ou os 11) — ver §2.

### 3.2 Hero / capa — referência `prima-capa.png` + marcação verde  ⚠️ a confirmar
- A Letícia circulou todo o hero e mandou a referência da **Pripa** (canecas coloridas agrupadas
  sobre blocos de cor, estilo mais lúdico/colorido).
- Possíveis interpretações (precisa de confirmação):
  - **(A)** Só trocar a foto da capa por uma nova (ex.: a melhor foto do grupo de canecas
    personalizadas), mantendo o layout atual.
  - **(B)** Reestilizar o hero no estilo Pripa — fundo em blocos de cor, canecas agrupadas,
    pegada mais colorida.
- **Recomendação:** confirmar com a Letícia o que a marcação verde quis dizer antes de mexer no
  layout do hero (evita retrabalho).

### 3.3 Cabeçalho da Coleção — marcação verde  ⚠️ a confirmar
- Ela circulou o título "Peças para uma mesa que respira." + o texto lateral
  ("Modelos que voltam ao ateliê…"). Pode ser: (a) trocar o texto, (b) só sinalizar que essa
  seção será atualizada (coincide com a troca das fotos do §3.1), ou (c) ajustar o título.
- **A confirmar** o que ela deseja exatamente nesse bloco.

### 3.4 Paleta de esmaltes / "bolinhas"
- Sem novidade nesta rev. Continua aguardando as **fotos individuais por cor** e os **hex oficiais**
  (pendência herdada da rev 04/06). O código já aceita `img` por cor.

### 3.5 Descrição padrão das peças
- Já está no ar na seção **"Sobre as peças / Cuidados"** (#cuidados), com o texto do `melhorias.md`
  (prazo 35–45 dias, micro-ondas/lava-louças, atóxico, autenticidade). Sem ação — só validar.

---

## 4. Decisões técnicas
- **Imagens:** manter o padrão atual — arquivos em `dist/media/colecao/`, referenciados por
  `<img src>`, sem base64. Otimizar (redimensionar/comprimir) os JPEGs do WhatsApp antes de subir.
- **Slug dos arquivos:** kebab-case sem acento (`bowl-molho.jpg`, `tabua-petiscos.jpg`, etc.).
- **Branch:** seguir na `ajustes-feedback-leticia-0406` (ou abrir nova `ajustes-feedback-leticia-1706`).
- **Deploy:** Vercel (arrastar `dist/` ou `vercel --prod`). Rollback pelo "Promote to Production"
  de um deploy anterior.

---

## 5. Pontos a confirmar com a Letícia (antes de aplicar)
1. **Hero:** só trocar a foto (opção A) ou reestilizar no padrão Pripa colorido (opção B)?
2. **Coleção:** exibir todas as **11 peças**, ou curar para 9 / 6?
3. **Cabeçalho da Coleção:** o que mudar no título/texto que ela circulou?
4. **Preço:** manter "Sob consulta" em todas, ou ela vai informar valores?
5. **Foto principal de cada peça:** posso escolher a melhor de cada pasta, ou ela tem preferência?

---

## 6. Ordem de execução sugerida
1. ✅ Ler e validar este planejamento com o Sérgio/Letícia (responder §5).
2. Processar e otimizar as 11 fotos oficiais → `dist/media/colecao/`.
3. Reescrever a seção **Coleção** (nomes, fotos, tags de cor).
4. Ajustar **hero** e **cabeçalho da coleção** conforme resposta da §5.
5. Revisar no navegador (desktop + mobile) e fazer deploy.

---

## 7. ✅ Status — aplicado em 17/06/2026

Decisões do cliente (Sérgio, em nome da Letícia):
- **Hero:** reestilizar no estilo Pripa (colorido), **imagem do mesmo tamanho** e **escrita sobre a imagem**.
- **Coleção:** exibir **todas as 11 peças**.
- **Cabeçalho da coleção:** manter o que ela circulou (a atualização da seção = as fotos/produtos novos).
- **Preço:** "Sob consulta" em todas até a cliente definir.
- **Foto de cada peça:** escolha minha (a melhor de cada pasta).

Aplicado em `dist/index.html`:
- ✅ **Hero** reestilizado: fundo com blocos de cor suaves (peach/azul/rosa/verde), card de imagem
  centrado (`hero-capa.jpg`, mesmas proporções 4:3) com **título sobreposto** ("Cada peça conta uma
  história.") sobre a área clara da foto + scrim para legibilidade; lede e CTAs abaixo da imagem.
  Removidos `.hero-grid/.hero-visual/.hero-tag`; novo `.hero-stage/.hero-figure/.hero-write/.hero-foot`.
  Preview: `rev/17062026/preview-hero.png`.
- ✅ **Coleção** reconstruída com as **11 peças oficiais** (nomes das pastas), fotos em
  `dist/media/colecao/` e o "dot" de cor por peça:
  Caneca personalizada (várias) · Xícara e pires (azul anil) · Xícara gota (verde petróleo) ·
  Conjunto japonês (preto) · Prato grande (azul água) · Prato de sobremesa (mostarda) ·
  Saladeira grande (azul petróleo) · Bowl com compartimento (branco) · Tábua para petiscos (marfim) ·
  Porta-joias (branco) · Porta-pincéis (rosa salmão).

**Fotos escolhidas (origem → destino):** uma por peça, copiadas de `rev/17062026/coleção/<peça>/`
para `dist/media/colecao/`. Trocar é só substituir o arquivo de mesmo nome.

**Pendente:** revisão final no navegador real (mobile) e **deploy no Vercel**.
