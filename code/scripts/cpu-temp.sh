#!/bin/sh

sensors -j | jq '(.["coretemp-isa-0000"].["Package id 0"].["temp1_input"] * 1) as $temp | {"text": ($temp | tostring), "alt": (if $temp < 80 then "normal" else "high" end), "class": [if $temp >= 80 then "high" else "normal" end] }' --unbuffered --compact-output
