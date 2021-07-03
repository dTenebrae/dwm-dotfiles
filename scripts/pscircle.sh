#!/usr/bin/env bash

TIME_INTERVAL=2 # Seconds

output=$HOME/.cache/pscircle.png

while [ 1 ]; do
    pscircle \
        --background-color=1e2226 \
        --link-color-min=375143a0 \
        --link-color-max=375143 \
        --dot-color-min=7c762f \
        --dot-color-max=b56e46 \
        --tree-font-size=18 \
        --tree-font-color=94bfd1 \
        --tree-font-face="Fira code" \
        --toplists-row-height=35 \
        --toplists-font-size=24 \
        --toplists-font-color=C8D2D7 \
        --toplists-pid-font-color=7B9098 \
        --toplists-font-face="Liberation Sans" \
        --cpulist-center=-350:700 \
        --memlist-center=350:700 \
        --tree-center=400:-200 \
        --tree-rotation-angle=2.75 \
        --tree-radius-increment=200 \
        --output=$output

    feh --bg-scale $output
    sleep $TIME_INTERVAL
done
