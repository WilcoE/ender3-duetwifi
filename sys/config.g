; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;

; General preferences
G21						                          ; Work in millimetres
G90                                               ; Send absolute coordinates...
; M83                                             ; ...but relative extruder moves
M555 P1						                      ; Set firmware compatibility to look like RepRapFirmware

; Network
M550 Pe3                                           ; Set machine name
M552 S1                                            ; Enable network

M586 P0 S1                                         ; Enable HTTP
M586 P1 S0                                         ; Disable FTP
M586 P2 S0                                         ; Disable Telnet

; Drives
M569 P0 S1                                         ; Drive 0 (X) goes forward
M569 P1 S1                                         ; Drive 1 (Y) goes backwards
M569 P2 S0			                               ; Drive 2 (Z) goes backwards
M569 P3 S1                                         ; Drive 3 (E) goes forwards
M350 X16 Y16 Z16 E16 I1                            ; Configure microstepping with interpolation

M92 X80.48 Y80 Z402.81 E530 	   		           ; Set steps per mm


M566 X1000 Y1000 Z100 E30000                       ; Set maximum instantaneous speed changes (mm/min)
M203 X6000 Y6000 Z500 E1500                        ; Set maximum speeds (mm/min)

M201 X300 Y300 Z100 E5000                          ; Set accelerations (mm/s^2) was 500 you changed it to 300 for stall guard
M906 X500 Y500 Z500 E1000 I30                      ; Set motor currents (mA) and motor idle factor in per cent
M84 S300                                           ; Set idle timeout

T0

M208 X-5.5 Y-10 Z0 S1                              ; Set axis minima
M208 X258.5 Y246 Z260 S0                           ; Set axis maxima


; Endstops
M574 X1 Y1 S3                                      ; Set endstops controlled by motor l
M915 X Y S1 R3 F0       			               ; set X and Y to sensitivity 1, when stall home XY and resume print, unfiltered so it does not takes 4 steps to figure out it has stalled.


; Z-Probe
M574 Z1 S2                                         ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                                ; Disable heater on PWM channel for BLTouch
M307 H4 A-1 C-1 D-1                                ; Disable heater on PWM channel for BLTouch

M558 P9 H5 F200 R0.2 T6000 A5 B1

; G31 - Sets Z probe trigger value, offset and trigger height
;       higher Z parameter pushes the first layer into the bed
;       lower Z-parameter lifts it up

; G31 P500 X-42 Y-5 Z1.80                     ; Set Z probe trigger value, offset and trigger height
G31 P500 X-42 Y-5 Z1.82                     ; Set Z probe trigger value, offset and trigger height

M557 X50:185 Y50:185 S65                    ; Define mesh grid    M557 X20:215 Y20:215 S65
M375					    ; Load height map from file (same as G29 S1)

; Heaters

M307 H0 A90.0 C700.0 D10.0 S1.00 V0.0 B1	 	
M307 H1 A296.1 C172.5 D5.2 S0.50 V24.9 B0	          ; Created with M303 H1 P0.5 S200

M305 P0 T100000 B4092 R4700                           ; set thermistor + ADC parameters for heater 0
M305 P1 T100000 B4092 R4700                           ; set thermistor + ADC parameters for heater 1

M143 H0 S120                                          ; Set temperature limit for heater 0 to 120C
M143 H1 S280                                          ; Set temperature limit for heater 1 to 280C


; config-override heeft nu onderstaande setting
; M307 H1 A544.1 C154.1 D6.6 S1.00 V24.7 B0	   ; Heate 1 PID Tuning	

; Fans
M106 P1 T45 H1					   ; Fan 1 Heater 1 

; Tools
M563 P0 D0 H1                                      ; Define tool 0
; M563 P0 D0 H1 F2             			   ; tool 0 uses extruder 0,heater 1 and fan 2
G10 P0 X0 Y0 Z0                                    ; Set tool 0 axis offsets
G10 P0 R0 S0                                       ; Set initial tool 0 active and standby temperatures to 0C

; Other settings
G29 S1						   ; Enable automatic bed mesh compensation
M106 P2 S0 I0 H-1 C"Led"			   ; Enable LED Control


; M572 D0 S0.4					   ; Enable pressure-advance of 0.15 seconds
; M207 S4.0 F2400 Z0.075				   ; Enable firmware retraction

; Miscellaneous
M501                                               ; Load saved parameters from non-volatile memory
