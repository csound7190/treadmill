
instr 1
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 220, 0, 32
event_i "i", 8000, 0, 32
endin

instr 220
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
endin

instr 269
;event_i "i", 366, 0, 0.25, 50*3, p4, p5
;event_i "i", 367, 0.50*0.75, 0.25, 50*4, p4, p5
;event_i "i", 367, 1.25, 0.25, 50*2, p4, p5
endin

instr 270
;event_i "i", 330, 0, 2
event_i "i", 290, 0, 0.25, 4, 5, .75
event_i "i", 383, 0, 4.17, 4, 8
event_i "i", 290, 3, 0.50, 3, 5, .5
event_i "i", 382, 1.75, 4.17, 0.5, 32 ;bark
event_i "i", 366, 0.50, 0.25, 50*3, p4, p5 ;zip
event_i "i", 367, 1.00, 0.15, 50*2, p4, p5 ;zip
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

instr 367
iws = -1
ke linseg 0,0.01,15000,p3,0
kef expseg p4*p6,p3*0.75,p4*p5
asaw vco2 0.5, p4, 0, 0, 0, 0.50
asaw table asaw, iws, 1, 0.5, 1
afilt lowpass2 asaw, kef, 50
afilt = (1/1000)*64*int(1000*afilt/64)
afilt table afilt, iws, 1, 0.5, 1
afilt butbp afilt, girnd[0], girnd[1]
afilt *= ke
zaw afilt, 6
endin

instr 382
aplk pluck 1, gifun*p4, gifun*p5, 0, 1
aplk butbp aplk, 700, 600
aplk *= 20000
outs aplk, aplk
endin

instr 383
ksidechain oscili 6, gitempo/60, -1, 0.10
ksidechain = ampdbfs(-7-ksidechain)
itriw ftgenonce 0,0,16384,11,3,5
aplk pluck 1, gifun*p4, gifun*p5, itriw, 1
aplk2 pluck 1, gifun*p4*1.012267, gifun*p5, itriw, 1
asum = ksidechain*.5*(aplk+aplk2)
outs asum, asum
endin

instr 290 ;beepy bass
ke linseg 0,0.02,5000,p3,0
kex linseg 0,0.150,p6,0.250,0
aosc foscil ke*(1+3*gkauto[0]), gifun, p4, p5, kex, -1
zaw aosc, 10
endin

instr 8000
printk2 zkr:k(0)
abypass zar 0
azvar1 zar 6
azvar2 zar 8
azvar3 zar 10
abus comb azvar1, 6.00, 0.375
abus2 comb azvar2, 12.00, .75
abus3l, abus3r babo azvar3,6,4,3,14.39,11.86,10
asumL = azvar1+azvar2++abus+abus2+abus3l
asumR = azvar1+azvar2+abus+abus2+abus3r

outs asumL, asumR
zacl 0, 64
endin
