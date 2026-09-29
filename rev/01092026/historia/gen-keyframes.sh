#!/bin/bash
# Quadros-chave da história "Como funciona": mesma mulher (Laura), mesma caneca, mesma caixa.
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
H=rev/01092026/historia
MUG=dist/media/colecao/caneca-personalizada/01.jpg
STYLE="Photorealistic editorial photograph, soft natural window light, warm cream, sand and oat palette with charcoal accents, muted natural colors, calm and minimal composition with generous negative space, film-like shallow depth of field, premium handmade-ceramics brand aesthetic, quiet and contemplative mood. No readable text or logos anywhere except where explicitly requested, no watermark."
WOMAN="Laura: a woman in her early thirties with dark wavy shoulder-length hair loosely tied back, warm light skin, natural makeup, wearing a cream linen shirt with the sleeves rolled up"
MUGD="the handmade ceramic mug from the mug reference image, exactly the same: lilac-periwinkle glossy glaze, raw sand-colored clay base band at the bottom with the name LAURA stamped in relief in lilac, same round handle and proportions"
BOXD="a rigid off-white cream gift box with a natural linen ribbon tied in a bow and a small kraft tag"
gen() { n=$1; shift; refs=("$@"); prompt="${PROMPT}"
  [ -f $H/$n.png ] && return
  args=(); for r in "${refs[@]}"; do args+=(--image "$r"); done
  url=$(higgsfield generate create gpt_image_2_5 --aspect_ratio 3:2 --resolution 2k --quality high "${args[@]}" --prompt "$prompt" --wait --wait-timeout 6m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $H/$n.png "$url"; echo "OK $n";; *) echo "FAIL $n: $url";; esac; }

PROMPT="$STYLE Scene: a bright, calm home corner. $WOMAN, seen in profile from behind her left shoulder, sits at a light oak desk beside a window, looking at an open laptop. The laptop screen shows an elegant minimal online ceramics shop page in cream and sand tones with a soft grid of handmade ceramic pieces, one lilac mug slightly highlighted (abstract shapes, no readable text). A small green plant and a linen curtain in the background. Wide-medium shot, camera at eye level."
gen k01 $MUG

PROMPT="$STYLE Scene: close shot of the same laptop screen and her hand on the trackpad, $WOMAN visible softly blurred at the edge of frame (same woman as the first reference image, same home, same desk and window). The screen shows a minimal product page for $MUGD, large in the center, with a row of small round glaze color swatches below and a small personalization field where the name is written; abstract UI, no readable text apart from the stamped name. Warm light, tender and quiet moment of choosing."
gen k02 $H/k01.png $MUG

PROMPT="$STYLE Scene: the same desk, laptop and window as the first reference image, same woman $WOMAN watching. The physical mug, $MUGD, is gently rising out of the laptop screen, half of it already emerged into the real room above the keyboard, the rest still inside the glowing screen, very subtle soft light on the screen edge, understated and elegant, not magical or childish. Her face in soft profile with a quiet, amazed smile."
gen k03 $H/k01.png $MUG

PROMPT="$STYLE Scene: a small artisan pottery atelier workbench in warm daylight: light wood table, linen cloth, sheets of cream tissue paper, natural twine, a few clay-dusted tools, shelves of unglazed pots softly blurred behind. $MUGD, stands on the bench in the center, freshly finished. An artisan's hands (only hands and forearms visible, clay-dusted linen apron) are about to pick it up. Close medium shot, camera slightly above, shallow depth of field."
gen k04 $MUG

PROMPT="$STYLE Scene: same atelier workbench as before. The artisan's hands carefully wrap $MUGD in cream tissue paper and lower it into $BOXD, which is open on the bench, nested in soft paper shreds. The name LAURA is still partly visible on the mug. Delicate, careful gesture, close medium shot."
gen k05 $H/k04.png $MUG

PROMPT="$STYLE Scene: same atelier workbench. The artisan's hands finish tying the linen ribbon of $BOXD, now closed, and place a small white shipping label with handwritten name LAURA on the lid. Top-down three-quarter view, tidy and calm."
gen k06 $H/k05.png

PROMPT="$STYLE Scene: outside the atelier on a quiet sunlit cobbled street, the artisan's hands (clay-dusted linen sleeves, only forearms visible) lift $BOXD, closed, with the small label into the open rear doors of a small cream-colored vintage-inspired delivery van with no logos, the box resting on a folded linen blanket inside. Warm morning light, calm."
gen k07 $H/k06.png

PROMPT="$STYLE Scene: the same small cream delivery van from the reference image driving away down the quiet sunlit cobbled street, seen from behind at a slight angle, rear doors closed, gentle motion, long soft shadows, lots of empty space, a tree-lined street ahead."
gen k08 $H/k07.png

PROMPT="$STYLE Scene: the doorstep and entry table of Laura's home, same home style, warm light. $BOXD with the small white label LAURA (exactly the same box as in the reference image) rests on a light wooden table by the door. Laura's hands (same woman as the first reference image, cream linen sleeves) reach toward the box. Medium close shot."
gen k09 $H/k06.png $H/k01.png

PROMPT="$STYLE Scene: same home, same woman ($WOMAN, same as the first reference image) sits at the light oak desk by the window and carefully lifts the lid of $BOXD (same box as the reference image), the cream tissue paper partly unfolded, the lilac mug with the stamped name LAURA just visible inside. Gentle anticipation in her expression, very subtle."
gen k10 $H/k01.png $H/k06.png $MUG

PROMPT="$STYLE Scene: final image closing the story, mirroring the first image: the same woman $WOMAN sits at the same light oak desk beside the same window, now holding $MUGD in both hands close to her chest, looking at it with a soft, quiet, satisfied smile; the laptop is closed beside her, the open cream box with tissue paper on the desk. Wide-medium shot, same framing as the first image."
gen k11 $H/k01.png $MUG $H/k06.png
echo DONE
