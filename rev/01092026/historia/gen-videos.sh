#!/bin/bash
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
H=rev/01092026/historia
COMMON="Slow, calm, cinematic and contemplative. Very gentle natural motion only, soft easing, no camera shake, no fast movement, no text, no logos. Keep every object exactly consistent: the same woman, the same lilac ceramic mug with the stamped name LAURA, the same cream gift box with linen ribbon."
vid() { name=$1 a=$2 b=$3 prompt=$4
  [ -f $H/$name.mp4 ] && return
  url=$(higgsfield generate create kling3_0 --aspect_ratio 16:9 --duration 5 --mode std --sound off --start-image $H/$a.png --end-image $H/$b.png --prompt "$prompt $COMMON" --wait --wait-timeout 9m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $H/$name.mp4 "$url"; echo "OK $name";; *) echo "FAIL $name: $url";; esac; }
vid t01 k01 k02 "The camera glides slowly closer to the laptop over her shoulder while her hand scrolls and she looks at the screen; the screen shows the lilac mug product page being chosen."
vid t03 k03 k04 "A soft, elegant dissolve match-cut: the mug that just emerged from the laptop screen floats gently and the warm home room melts into a small artisan pottery atelier, where the very same lilac mug now stands on the wooden workbench as an artisan's hands approach it."
vid t04 k04 k05 "The artisan's hands carefully lift the mug, wrap it in cream tissue paper and lower it into the open cream box nested in paper shreds. Delicate, careful gesture."
vid t05 k05 k06 "The artisan gently folds the tissue over the mug, closes the lid of the cream box, ties the natural linen ribbon into a bow and places the small white label with the handwritten name LAURA. Tidy and calm."
vid t06 k06 k07 "The artisan lifts the closed cream box with the ribbon and label and carries it out of the atelier into sunlight, placing it into the open rear of a small cream delivery van on a folded linen blanket. Smooth continuous movement."
vid t07 k07 k08 "The artisan gently closes the rear doors of the small cream vintage delivery van, which then slowly starts driving away down the quiet sunlit cobbled street under the trees, shrinking gently into the distance."
vid t08 k08 k09 "A slow, soft cross-dissolve as the van disappears into the distance and the scene becomes Laura's bright home: she sits at her light oak desk by the window and the cream gift box has arrived on the desk in front of her, her hands resting beside it."
vid t09 k09 k10 "Laura carefully pulls the linen ribbon, lifts the lid of the cream box and unfolds the tissue paper, revealing the lilac mug with the name LAURA inside. Gentle anticipation, very subtle expression."
vid t10 k10 k11 "Laura slowly lifts the lilac mug with the name LAURA out of the box and holds it with both hands close to her chest, looking at it with a soft, quiet, satisfied smile. The laptop is closed beside her."
echo DONE
