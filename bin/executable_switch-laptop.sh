#!/bin/sh

# Switch laptop between left and right sides - better for your neck :-)
# Requires displayplacer - https://github.com/jakehilborn/displayplacer
# The values are the commands suggested at the end of `displayplacer list`
# for each arrangement

set -euo pipefail
side=$1

if [[ $side == "l" ]]; then
  displayplacer "id:DC12CEDE-19DC-4B10-ADF8-7391E5746A68 res:2560x1440 hz:60 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(-1512,458) degree:0"
elif [[ $side == "r" ]]; then
  displayplacer "id:DC12CEDE-19DC-4B10-ADF8-7391E5746A68 res:2560x1440 hz:60 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(2560,458) degree:0"
fi
