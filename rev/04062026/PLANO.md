# Plano de ajustes — LP Ateliê Pavanelli (rev 04/06/2026)

Baseado no feedback da cliente Letícia Pavanelli (`melhorias.md`) e na análise da LP atual
(`dist/index.html` — arquivo único com imagens embutidas em base64).

---

## 1. Pontos identificados no feedback

| # | Pedido da Letícia | Tipo | Status / dependência |
|---|-------------------|------|----------------------|
| 1 | Nova **paleta de cores** (23 cores) substituindo as 18 atuais | Conteúdo + código | Temos a lista de nomes; **falta hex oficial** (aproximamos) |
| 2 | **Descrição padrão** das peças (cuidados, prazo, atóxico, etc.) presente "em todas as peças" | Conteúdo novo | Texto já fornecido |
| 3 | "Algo assim na página inicial" — ref `05b2c742` (print do site pripa.com.br) | Layout hero | Referência de estilo |
| 4 | Usar `4d93ca75` (8 canecas personalizadas com nomes, fundo creme) como **capa** | Imagem hero | Imagem disponível ✅ |
| 5 | **Trocar as imagens da coleção** pelas novas (fundo uniforme, cores originais) | Imagens | 30 fotos disponíveis ✅ |
| 6 | Colocar **a foto real da cor nas "bolinhas"** (swatches) | Código + imagens | **Bloqueado** — fotos individuais por cor ainda não existem ("vou tirar fotos melhores") |

> Observação: pontos **3 e 4 convergem** — a referência da pripa é justamente um conjunto de
> canecas coloridas agrupadas, e a capa escolhida (`4d93ca75`) é exatamente esse tipo de foto.
> Tratamos como um único ajuste de hero.

---

## 2. Estrutura atual da LP (para referência)

`dist/index.html` (linha aprox.):
- Header (990) · Hero (1011) · Sobre (1046) · Vídeo (1078) · **Coleção** (1098, 6 cards base64)
  · **Esmaltes** (1184, trilho de 18 swatches em hex) · Processo (1216) · Personalizar (1246) · Footer (1276)
- JS: array `ESMALTES` (linha 1311) gera os swatches; vídeo `media/processo.mp4`; logo `media/logo.png`.
- **Todas as fotos de produto estão embutidas como base64** no HTML.

---

## 3. Catálogo das fotos novas (pasta `rev/04062026`)

Fundo neutro/creme uniforme, qualidade alta — perfeitas para a coleção.

**Hero / capa**
- `4d93ca75` — 8 canecas personalizadas (nomes) em pé, fundo creme → **CAPA**

**Xícaras / canecas (com nome gravado)**
- `1699ab5a` — caneca preta salpicada "VICTOR"
- `839b9c36` — caneca azul jeans "BRUNO"
- `868bddcc` — caneca preta "SOFIA"
- `ba66427a` — caneca verde-musgo "LUCAS"
- `f7d57c11` — caneca azul claro "VICTOR HUGO"
- `56028304` — caneca marrom/chocolate "CAIO"

**Xícaras / canecas (lisas, mostram bem a cor)**
- `0b29ae7b` — caneca azul bebê
- `1cdbb861` — caneca azul petróleo
- `82bf31d2` — caneca verde-musgo (cinza-gris)
- `9aa64779` — caneca preta salpicada
- `c22fa1f1` — caneca cinza/marrom salpicada
- `e4e9c329` — caneca azul mirtilo/anil salpicada
- `df4093d3` — vista de cima, interior azul bebê

**Jogos xícara + pires "personalizado"**
- `1a3e8625` — espresso branco + pires "personalizado"
- `9c00400f` — jogo verde bandeira (par) "personalizado"
- `ad3ac3a9` — jogo azul anil (par) "personalizado"
- `ea604bd6` — jogo azul anil (mão segurando) "personalizado"

**Pratos**
- `5f996db9` — pratos mostarda/laranja godiva (par)

**Bowls / petisqueiras**
- `317820a3` — petisqueira branca (2 cavidades)
- `c3d16f9a` — petisqueira branca (2 cavidades, ângulo)
- `c943ffd1` — petisqueira branca (vista de cima)
- `6be9b558` — par de bowls esculzidos verde petróleo
- `8655ac0a` — par de bowls esculpidos verde petróleo
- `5954d684` — bowls verde petróleo (vista de cima)

**Decorativos / utilidades**
- `832a3e2e` — porta-pincéis rosa com bolinhas
- `5f996db9`/`e43968d0` — `e43968d0` = ring dish branco com joias (porta-joias/bandejinha)

**Assinatura / detalhe**
- `7e5204e5` — fundo da peça com carimbo "Letícia Pavanelli" (ótimo para seção "Sobre"/autenticidade)

**Referências de cor (NÃO usáveis como swatch individual)**
- `WhatsApp...15.37.54` — grade "CORES DISPONÍVEIS" (6 cores, baixa res, rótulos embutidos)
- `95911b19` — recorte textura branco/marfim (≈70×70px)
- `a0e06422` — recorte textura rosa figo (pequeno)

---

## 4. Mudanças propostas (por seção)

### 4.1 Hero (capa) — pontos 3 + 4
- Substituir a imagem atual do hero por `4d93ca75` (canecas personalizadas, fundo creme).
- Ajustar a `hero-tag` (selo "Feito à mão, uma peça por vez") para combinar com a nova foto.
- Manter título/CTA. Opcional: leve faixa de cor de fundo no estilo pripa (a definir).

### 4.2 Coleção — ponto 5
- Trocar os 6 cards base64 pelas fotos novas. Mapa proposto (6 cards):
  1. `4d93ca75`? não (vai pro hero) → **Xícara personalizada**: `1699ab5a` (VICTOR)
  2. **Jogo xícara + pires**: `1a3e8625` (espresso branco personalizado)
  3. **Caneca**: `0b29ae7b` (azul bebê) ou `839b9c36` (BRUNO)
  4. **Bowls esculpidos**: `6be9b558` (verde petróleo)
  5. **Petisqueira**: `317820a3` (branca 2 cavidades)
  6. **Porta-pincéis / decorativo**: `832a3e2e` (rosa)
- Atualizar nome, tag de cor e o "dot" de cada card conforme a foto.
- (Opcional) expandir para 8 cards aproveitando o acervo — a confirmar.

### 4.3 Esmaltes / "bolinhas" — pontos 1 + 6
- Atualizar o array `ESMALTES` para a **nova lista de 23 cores**:
  branco, marfim, mostarda, chocolate, azul bebê, azul piscina, azul turquesa, azul hortênsia,
  azul anil, azul mirtilo, azul água (matte), verde esmeralda, verde bandeira, verde petróleo,
  verde erva doce, cinza gris, rosa salmão, laranja godiva, rosa figo (matte), roxo malva (matte),
  verde alga (matte), preto.
- **Hex:** como não temos os valores oficiais, usamos aproximações (Letícia valida depois).
- **Foto real na bolinha:** preparar o componente do swatch para aceitar `background-image`
  (foto circular da cor) em vez de cor chapada. Como as fotos individuais por cor **ainda não
  existem**, entregamos com a cor aproximada agora e trocamos por foto quando ela enviar.
  → **Precisamos da Letícia: 1 foto recortada por cor (23), quadrada/circular, fundo da glasura.**

### 4.4 Descrição padrão das peças — ponto 2
- Adicionar bloco/seção com o texto padrão (microondas, lava-louças, evitar chama, atóxico,
  prazo 35–45 dias, variações artesanais). Local sugerido: nova seção "Sobre as peças / Cuidados"
  entre Coleção e Esmaltes, ou dentro de "Personalizar". (a confirmar local)

---

## 5. Decisão técnica: onde guardar as imagens
- **Recomendado:** extrair as fotos para `dist/media/` e referenciar por caminho
  (`<img src="media/colecao-01.jpg">`). Deixa o HTML leve, facilita trocas futuras e segue o
  padrão que já existe (logo.png, processo.mp4). Hoje tudo é base64 (HTML de 543 KB).
- Alternativa: continuar com base64 (sem novos arquivos, porém HTML pesado e difícil de manter).

---

## 5B. ✅ Status — aplicado em 15/06/2026

- ✅ **Imagens externalizadas** para `dist/media/` (HTML caiu de 543 KB → ~55 KB, sem base64).
- ✅ **Capa do hero** trocada por `hero-capa.jpg` (8 canecas personalizadas). Slot ajustado de
  4:5 → **4:3** para mostrar todas as canecas sem corte.
- ✅ **Coleção** com as 6 fotos novas (fundo uniforme) + nomes/tags/cores atualizados:
  Xícara personalizada (Preto) · Jogo xícara+pires (Branco) · Caneca (Azul bebê) ·
  Bowls esculpidos (Verde petróleo) · Petisqueira (Branco) · Porta-pincéis (Rosa salmão).
- ✅ **Nova seção "Sobre as peças / Cuidados"** (#cuidados) com prazo 35–45 dias, micro-ondas/
  lava-louças, atóxico e nota de autenticidade. Link "As peças" adicionado ao menu.
- ✅ **Paleta de esmaltes** atualizada para a nova lista (**22 cores** — a lista do feedback tem 22
  itens, não 23), com hex **aproximado**, marcação **matte** (azul água, rosa figo, roxo malva,
  verde alga) e mecanismo pronto para receber **foto por cor** (campo `img`).

## 6. O que precisamos / pendências com a cliente
1. **Fotos individuais das 23 cores** para as bolinhas (recorte uniforme). — bloqueia o ponto 6 completo.
2. **Hex oficial** das cores (ou validação das nossas aproximações).
3. Confirmar **quantos cards** na coleção e **quais peças/nomes/preços**.
4. Confirmar **onde** entra o texto de descrição padrão.
