#!/usr/bin/env python2
# coding=UTF-8

import math, subprocess
import sys

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

icons = ["", "", "", "", "", "", "", "", "", "", ""];



# Output

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0)))

#  * u'■' #◼
# old arrow: ▹▸▶
empty = (total_slots - filled) * u'□' #◻

# out = (filled + empty).encode('utf-8')
out = icons[filled]

color_green = '%{[32m%}'
color_yellow = '%{[33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if filled > 6
    else color_yellow if filled > 3
    else color_red
)

out = color_out + out + color_reset
sys.stdout.write(out)
