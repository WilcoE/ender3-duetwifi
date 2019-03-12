; homex.g

G91                     ; relative positioning
G1 S2 X0.2 Y0.2 Z0.2 	; Move all axis 0.2 mm, clear stall status
M400			; make sure everything has stopped before we make changes
M915 X S2  R0 F0	; set X and Y sensitivity, do nothing when stall, unfiltered
M574 X1  S3		; set endstops to use motor stall
G1 S1 X-265 F5000       ; move X, stopping at the end stop
G1 Z-0.2	        ; Move all axis -0.2 mm,
M400			; make sure everything has stopped
G90 			; back to absolute mode
M915 X S2 Y S3 R3 F0       ; set X and Y sensitivity to 0, when stall home XY and resume print, filtered so it takes 4 steps to figure out it has stalled
