
instr 110 ;"The Eternal Return"
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 220, 0, 32
event_i "i", 8000, 0, 32
endin

instr 220 ;"The Eternal Return"
girnd[0] random 3000, 10000
girnd[1] = (girnd[0]-1000)/2
p3 = 64*60/gitempo
kzk0 metro gitempo/60 ;tempo trigger
printf "!!!!! %f, %f \n", kzk0, girnd[0], girnd[1]
ametronome mpulse 32000, 60/gitempo
ametronome lowpass2 ametronome, 2367, 5
outs ametronome, ametronome
kzk0 *= linseg:k(1,p3,65)
zkw kzk0, 0
;-------------automation

gkauto[0] line 0, p3, 1

;-----------------------
icount init 0
event_i "i", 271, 0, 0
event_i "i", 272, 0, 0
event_i "i", 271, 4, 0
event_i "i", 271, 8, 0
event_i "i", 271, 12, 0
event_i "i", 273, 16, 0
event_i "i", 272, 16, 0
event_i "i", 273, 20, 0
event_i "i", 271, 24, 0
event_i "i", 273, 28, 0
endin

instr 271
event_i "i", 290, 0, 0.75, 50, 8, 9, 0.5, 10, 11
event_i "i", 290, 0.75, 0.15, 50, 8, 9, 1, 10, 11
endin

instr 272
event_i "i", 290, 2.25, 0.25, 50, 9, 9, 1, 10, 11
event_i "i", 290, 3.50, 0.45, 50, 8, 9, 0.5, 10, 11
endin

instr 273
event_i "i", 290, 0, 0.75, 50, 9, 9, 0.5, 10, 11
event_i "i", 290, 0.75, 0.15, 50, 9, 9, 1, 10, 11
endin

instr 290 ;FM with pfields(F1, C, M, Xmax, zaL, zaR)
;amplitude envelope
ke linseg 0,0.02,1,p3,0
;index envelope
kex linseg 0,0.0090,p7,p3,0
;fm synth
aosc foscil ke, p4, p5, p6, kex, -1
;patchbay send
zaw aosc*10000, p8
zaw aosc*10000, p9
endin


instr 8000
printk2 zkr:k(0)
abypass zar 0
azvar3 zar 10 ;2oFM
azvar3R zar 11
;-----BUS1
afdbk1L init 0
abus1L nestedap azvar3+(0.80*afdbk1L),3,0.1,.097,.11,.025,.07,.043,.09
afdbk1L delay tone(abus1L,4000), 0.125
abus1L atone abus1L, 1000
afdbk1R init 0
abus1R nestedap azvar3R+(0.80*afdbk1R),3,0.1,.083,.11,.023,.07,.053,.09
afdbk1R delay tone(abus1R,4000), 0.375
abus1R atone abus1R, 1000
;----
asumL = azvar3+abus1L
asumR = azvar3R+abus1R
;master stereo proccessing
outs asumL, asumR
zacl 0, 64
endin
