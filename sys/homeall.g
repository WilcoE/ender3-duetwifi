; homeall.g

G91                     ; relative positioning
G1 S2 X0.2 Y0.2 Z0.2 	; Move all axis 0.2 mm, clear stall status
M98 Pdeployprobe.g      ; deploy mechanical Z probe

; x and y Sensor less homing
M400			; make sure everything has stopped before we make changes
M915 X S2 Y S3 R0 F0	; set X and Y sensitivity, do nothing when stall, unfiltered
M574 X1 Y1 S3		; set endstops to use motor stall
G1 S2 Z10 F1200		; lift Z
G1 S1 X-265 Y-260 F5000 ; move X and Y back, stopping at the end stop
M400			; make sure everything has stopped
G90 			; back to absolute mode

;G1 X115 Y115 F12000	; Move to center of bed and home Z
G1 X127 Y134 F6000 	; go to first bed probe point and home Z
G30 			; home Z by probing the bed

M915 X S10 Y S10 R3 F0       ; set X and Y sensitivity to -0, when stall home XY and resume print, filtered so it takes 4 steps to figure out it has stalled


M98 Pretractprobe.g     ; retract mechanical Z probe