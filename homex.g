; homex.g
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v2 on Thu Jan 31 2019 15:46:22 GMT+0100 (Midden-Europese standaardtijd)
G91               ; relative positioning
G1 Z5 F6000 S2    ; lift Z relative to current position
G1 S1 X-240 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000       ; go back a few mm
G1 S1 X-240 F360  ; move slowly to X axis endstop once more (second pass)
G1 Z-5 F6000 S2   ; lower Z again
G90               ; absolute positioning

