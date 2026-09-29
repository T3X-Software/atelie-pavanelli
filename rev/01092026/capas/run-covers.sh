#!/bin/bash
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
out=rev/01092026/capas
BASE="Photorealistic lifestyle product photograph for a handmade ceramics website. Keep the ceramic product(s) from the reference image EXACTLY as they are: identical shape, proportions, glaze color, texture, stamped or printed text and every detail, do not redesign, recolor, add or remove anything on the product. Replace ONLY the plain taupe background with a warm, airy, sun-drenched scene: a warm beige limestone or linen tabletop and soft cream wall, soft golden window light coming from the upper left casting gentle diagonal leaf-and-window shadows across the surface and wall, shallow depth of field with a softly blurred background, natural realistic contact shadows under the product, warm neutral color grading. Landscape composition with the product centered and generous empty space around it. No text, no logos, no people, no hands."
declare -A HINT
HINT[porta-joias-floral]="Top-down flat lay of the three small dishes on warm beige linen, a few dried gypsophila and grass stems entering the frame from the top-left corner."
HINT[caneca-personalizada]="The mug stands on the beige stone table, with a small blurred vase with white cosmos flowers behind it on the left."
HINT[saladeira]="The bowl sits on the beige surface with a softly folded natural linen cloth behind it on the left and a green leaf at the right edge."
HINT[tabua-petiscos]="The sculptural white glossy tray rests on the beige surface with an olive branch sprig lying beside it."
HINT[xicara-gota]="The two teal pieces sit on the beige surface with a sprig of eucalyptus beside them."
HINT[copo-amassado]="The two cups sit on natural linen with a few dried pampas grass stems softly blurred behind them."
HINT[copo-amassado-vela]="The candle vessel stands on a light wooden tray on the beige surface, dried flowers softly blurred behind it, the candle is unlit."
HINT[xicara-pires]="The two cup-and-saucer sets sit on natural linen with tiny white flowers scattered beside them."
HINT[kit-presente]="The two candle dishes sit on beige linen with dried flowers softly blurred at the top-left."
HINT[conjunto-japones]="The black sushi set with chopsticks sits on a light pale wood surface, soft bamboo leaf shadows falling across the surface."
for d in porta-joias-floral caneca-personalizada saladeira tabua-petiscos xicara-gota copo-amassado copo-amassado-vela xicara-pires kit-presente conjunto-japones; do
  [ -f $out/$d.png ] && continue
  url=$(higgsfield generate create gpt_image_2_5 --aspect_ratio 3:2 --resolution 2k --quality high --image dist/media/colecao/$d/card.jpg --prompt "$BASE ${HINT[$d]}" --wait --wait-timeout 6m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $out/$d.png "$url"; echo "OK $d";; *) echo "FAIL $d: $url";; esac
done
echo DONE
