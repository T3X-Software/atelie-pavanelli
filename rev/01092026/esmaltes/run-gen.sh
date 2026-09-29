#!/bin/bash
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
out=rev/01092026/esmaltes
REF="rev/01092026/ChatGPT Image 29 de set. de 2026, 13_48_16.png"
BASE="Photorealistic top-down product photo of exactly five perfectly round flat circular ceramic glaze swatch discs in one horizontal row, evenly spaced and equal in size, on a plain flat uniform warm cream background (#EDE7D9), flat even soft lighting, no shadows, no reflections outside the discs, no labels, no text, nothing else. Each disc must have exactly the same look and speckled texture style as the swatches in the reference image: a smooth slightly glossy ceramic glaze with fine irregular dark-brown and black speckles of varied sizes scattered all over, subtle soft tonal variation, no border. Colors from left to right:"
gen() { name=$1; shift; [ -f $out/$name.png ] && return
  url=$(higgsfield generate create gpt_image_2_5 --aspect_ratio 16:9 --resolution 2k --quality high --image "$REF" --prompt "$BASE $*" --wait --wait-timeout 6m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $out/$name.png "$url"; echo "OK $name";; *) echo "FAIL $name: $url";; esac; }
gen row1 "1) hydrangea periwinkle blue (#9BAED4); 2) deep indigo navy blue (#34488F); 3) dark blueberry violet-blue (#3B3B6B); 4) pale aqua water blue-green, matte finish (#A7C9C7); 5) emerald green (#2E8B6B)."
gen row2 "1) flag green (#1E7A3D); 2) dark petrol teal green (#2E5B5B); 3) light fennel yellow-green (#A7B96A); 4) warm gray (#8A8A80); 5) salmon pink (#E8A89A)."
gen row3 "1) burnt orange (#D9772E); 2) fig rose dusty pink, matte finish (#B5707A); 3) mallow muted purple, matte finish (#9B7FA6); 4) soft algae sage green, matte finish (#8AA37B); 5) near black charcoal (#2B2B2B)."
echo DONE
