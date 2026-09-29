#!/bin/bash
cd /c/Users/sergio.junior/Documents/Sources/atelie-pavanelli
out=rev/01092026/produtos-fundo
for d in $(ls dist/media/colecao); do
  [ -f $out/$d.png ] && continue
  url=$(higgsfield generate create image_background_remover --image dist/media/colecao/$d/01.jpg --wait --wait-timeout 4m 2>&1 | tail -1)
  case "$url" in http*) curl -s -o $out/$d.png "$url"; echo "OK $d";; *) echo "FAIL $d: $url";; esac
done
echo DONE
