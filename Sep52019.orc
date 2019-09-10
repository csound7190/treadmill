
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
event_i "i", 272, 0, 0, 0
event_i "i", 271, 4, 0, 9
event_i "i", 272, 8, 0, 7
event_i "i", 272, 16, 0, 6
event_i "i", 271, 20, 0, 4
event_i "i", 272, 24, 0, 3

event_i "i", 271, 1, 0, 1
event_i "i", 271, 5, 0, 8
event_i "i", 271, 9, 0, 8
event_i "i", 271, 17, 0, 7
event_i "i", 271, 21, 0, 5
event_i "i", 271, 25, 0, 4


event_i "i", 272, 6, 0, 0
event_i "i", 272, 18, 0, 0
event_i "i", 272, 22, 0, 0

endin

instr 271
ipreset = p4
icount init 0
if1[] fillarray 16, 15, 14, 13, 13, 14, 15, 16, 15, 14
if2[] fillarray 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
ix[] fillarray 8,4,2,1,0.5
loop:
if (icount<17) then
event_i "i", 290, 0.125*icount, 0.12, 50, if1[ipreset], if2[ipreset], ix[icount%3], 10, 11
icount += 1
igoto loop
endif
endin

instr 272
ipreset = p4
icount init 0
if1[] fillarray 16, 15, 14, 13, 13, 14, 15, 16, 15, 14
if2[] fillarray 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
ix[] fillarray 6,8,4,2,1,0.5
loop:
if (icount<17) then
event_i "i", 291, 0.125*icount, 0.12, 50, if1[ipreset], if2[ipreset], ix[icount%4], 10, 11
icount += 1
igoto loop
endif
endin

instr 290 ;FM with pfields(F1, C, M, Xmax, zaL, zaR)
;amplitude envelope
ke linseg 0,0.02,1,p3,0
;index envelope
kex linseg 0,0.0090,p7,p3,0
;fm synth
ift ftgenonce 0,0,16384,10,4,0,3
aosc foscil ke, p4, p5, p6, kex, ift
;patchbay send
zaw aosc*300, p8
zaw aosc*300, p9
endin

instr 291 ;FM with pfields(F1, C, M, Xmax, zaL, zaR)
;amplitude envelope
ke linseg 0,0.02,1,p3,0
;index envelope
kex linseg 0,0.0020,p7,p3,0
;fm synth
ift ftgenonce 0,0,16384,10,4,0,1
aosc foscil ke, p4, p5, p6, kex, ift
;patchbay send
zaw aosc*300, p8
zaw aosc*300, p9
endin



instr 8000
ilmft ftgenonce 0,0,0dbfs*2,-7,-0dbfs,0dbfs*2,0dbfs
printk2 zkr:k(0)
abypass zar 0
azvar3 zar 10 ;2oFM
azvar3R zar 11
;-----BUS1
azvar3 tablei azvar3, ilmft, 0, 0dbfs, 0
azvar3R tablei azvar3R, ilmft, 0, 0dbfs, 0
afdbk1L init 0
abus1L nestedap azvar3+(0.80*afdbk1L),3,0.1,.0097,.11,.0025,.07,.0043,.09
afdbk1L delay tone(abus1L,4000), 0.75
abus1L atone abus1L, gifun*128
afdbk1R init 0
abus1R nestedap azvar3R+(0.60*afdbk1R),3,0.1,.0083,.11,.0023,.07,.0053,.09
afdbk1R delay tone(abus1R,4000), 0.150
abus1R atone abus1R, gifun*128
;----
asumL = abus1L*400
asumR = abus1R*400
;master stereo proccessing
outs asumL, asumR
zacl 0, 64
endin
