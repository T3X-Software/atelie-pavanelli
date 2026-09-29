#!/bin/bash
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
H=rev/01092026/historia
COMMON="Slow, calm, cinematic and contemplative. Very gentle natural motion only, soft easing, no camera shake, no fast movement, no text, no logos."
vid() { name=$1 a=$2 b=$3 prompt=$4
  [ -f $H/$name.mp4 ] && return
  url=$(higgsfield generate create kling3_0 --aspect_ratio 16:9 --duration 5 --mode std --sound off --start-image $H/$a.png --end-image $H/$b.png --prompt "$prompt $COMMON" --wait --wait-timeout 9m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $H/$name.mp4 "$url"; echo "OK $name";; *) echo "FAIL $name: $url";; esac; }
vid t05 k05 k06 "The artisan gently folds the tissue over the mug, closes the lid of the cream box, ties the natural linen ribbon into a bow and places the small white label with the handwritten name LAURA. CONTINUITY: the mug keeps its exact light lilac-periwinkle color at every moment, never dark blue or cobalt, even inside the box under the tissue paper; lighting stays soft and even."
vid t07 k07 k08 "The closed cream box with the ribbon is already resting on the folded linen blanket inside the small cream vintage delivery van. The artisan gently closes the rear doors of the van, which then slowly starts driving away down the quiet sunlit cobbled street under the trees, shrinking gently into the distance. CONTINUITY: no mug and no loose objects are ever visible outside the box; the artisan's hands hold nothing but the door."
vid t08 k08 k09 "A slow, soft cross-dissolve as the van drives away into the distance and the scene becomes Laura's bright home: she sits at her light oak desk by the window, and the closed cream gift box has arrived on the desk in front of her, her hands resting beside it. CONTINUITY: on the desk there is only the closed cream box, the closed laptop and an empty round cork coaster; no mug appears anywhere in the room at any moment."
echo DONE
