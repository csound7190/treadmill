
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
event_i "i", 270, 0, 0, 13, 10
event_i "i", 270, 4, 0, 12, 9
event_i "i", 270, 8, 0, 11, 8
event_i "i", 270, 12, 0, 10, 7
event_i "i", 270, 16, 0, 9, 6
event_i "i", 270, 20, 0, 8, 5
event_i "i", 270, 24, 0, 7, 4
event_i "i", 270, 28, 0, 6, 3
event_i "i", 271, 0, 0
event_i "i", 271, 8, 0
event_i "i", 271, 16, 0
endin





instr 267
i_trigged[] init 1
i_trigged[0] = 289
i_p4[] init 1
i_p4[0] random 400, 659
;event_i "i", i_trigged[0], 0.50*0.75, 0.25, 50*4, i_p4[0]
endin

instr 268
i_trigged[] init 1
i_trigged[0] = 289
i_p4[] init 1
i_p4[0] random 400, 659
;event_i "i", i_trigged[0], 0.00, 0.25, 50*4, i_p4[0]
;event_i "i", i_trigged[0], 0.50, 0.25, 50*4, i_p4[0]
endin

instr 269
i_trigged[] init 1
i_trigged[0] = 289
i_p4[] init 1
i_p4[0] random 400, 659
;event_i "i", i_trigged[0], 0.00, 0.25, 50*4, i_p4[0]
;event_i "i", i_trigged[0], 0.50, 0.25, 50*4, i_p4[0]
;event_i "i", i_trigged[0], 1.00, 0.25, 50*4, i_p4[0]
endin

instr 270 ;triggers 289
i_trigged[] fillarray 289, 290
i_p4[] fillarray 1000, 2000, 3000, 4000, 5000
event_i "i", i_trigged[0], 0.250, 0.25, i_p4[0]
event_i "i", i_trigged[0], 0.50, 0.25, i_p4[1]
event_i "i", i_trigged[0], 0.750, 0.25, i_p4[2]
event_i "i", i_trigged[0], 1.50, 0.25, i_p4[3]
event_i "i", i_trigged[0], 2.00, 0.25, i_p4[0]
event_i "i", i_trigged[0], 2.75, 0.25, i_p4[4]
;additional triggers
endin

instr 271
i_trigged[] fillarray 289, 290
i_trigged fillarray 290
i_p4[] fillarray gifun
i_p5[] fillarray 13
i_p6[] fillarray 1, 8
i_p7[] fillarray 8.85, 2.00
event_i "i", i_trigged[0], 0.00, 0.15, i_p4[0], i_p5[0], i_p6[0], i_p7[0]
event_i "i", i_trigged[0], random(2.75,2.80), 0.15, i_p4[0], i_p5[0], i_p6[1], i_p7[1]
endin



instr 289 ;gauss noise with pfields(gausscps, lfocps)
;amplitude envelope
ke madsr 0.026,0.408,1,0
;waveshaping env
iws ftgenonce 0,0,16384,10,32,0,16,0,8,0,4,0,2,0,1
agauss gausstrig 1, p4, random:i(0.5,1)
;waveshaping
agauss tablei agauss*0.25, iws, 1, 0, 1
itriw ftgenonce 0,0,16384,7,-1,8192,1,8192,-1
kcf = 1900+abs(oscili:k(1300,60/gitempo,itriw,-1))
agauss lowres -0.5*(agauss*0.5), kcf, 10
printk .250, kcf, 40
;send to patchbay
zaw agauss*20000, 14
endin

instr 290 ;FM with pfields(F1, C, M, Xmax)
;amplitude envelope
ke linseg 0,0.02,1,p3,0
;index envelope
kex linseg 0,0.0090,p7,p3,0
;fm synth
aosc foscil ke, p4, p5, p6, kex, -1
;patchbay send
zaw aosc*10000, 10
zaw aosc*10000, 11
endin

instr 330
acrashL soundin "277179.wav", 2.0, 0
itanhft ftgenonce 0,0,0dbfs*2,"tanh",-0dbfs/2,0dbfs/2,1
alm table acrashL, itanhft, 0, 0dbfs, 1
zaw acrashL, 8
endin

instr 366
iws = -1
ke linseg 0,0.01,15000,p3,0
kef expseg p4*p6,p3*0.75,p4*p5
asaw vco2 0.5, p4, 0, 0, 0, 0.50
asaw table asaw, iws, 1, 0.5, 1
afilt lowpass2 asaw, kef, 50
afilt = (1/1000)*64*int(afilt*1000/64)
afilt table afilt*0.75, iws, 1, 0.5, 1
afilt butbp afilt, girnd[0], girnd[1]
afilt *= ke
zaw afilt, 6
endin

;jcurran@winchesterts.org

instr 382 ;sadpad karpluss-strong synth
;p4 is pitch (scaled to gifun), p5 high
aplk pluck 1, gifun*p4, gifun*p5, 0, 1
aplk butbp aplk, 700, 600
aplk *= 20000
;patchbay send 12
zaw aplk, 12
endin

instr 8000
printk2 zkr:k(0)
abypass zar 0
azvar1 zar 6
azvar2 zar 8
azvar3 zar 10 ;2oFM
azvar3R zar 11
azvar4 zar 12 ;sadpad
azvar5 zar 14 ;gauss
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
asumL = azvar1+azvar2+azvar3+azvar4+azvar5+abus1L
asumR = azvar1+azvar2+azvar3R+azvar4+azvar5+abus1R
;master stereo proccessing
outs asumL, asumR
zacl 0, 64
endin
