instr 309 ;sleighbell proccess
ip4 = p4
isoundft ftgenonce 0,0,(65536*8),1,"478601.wav",0,0,1
istloc = p5
iendloc = p6
iamp = p7
aphs linseg istloc, p3, iendloc
ares tablei aphs, isoundft, 1
ares *= iamp
outs ares, ares
endin

instr 303 ;freezing mincer
isoundft = p4
istloc = p5
ifreezetime = p6
iendloc = p7
iamp = p8
itranspose = p9
izaout = p10
aosc[] init 1
ktm linseg istloc, ifreezetime, iendloc
aosc[0] mincer upsamp(ktm), 1, itranspose, isoundft, 0
afilt = aosc[0]*iamp
;outs afilt, afilt
zaw afilt, izaout
endin

instr 305 ;oscillating-position mincer
iinitpitch = p5
ipitch = p4
iamp = p7
ip8 = p8
kcps init p4
kf port kcps, 0.021, p5
aosc[] init 3
ktm oscil 0.75,0.25
printk .1, ktm, 40
aosc[0] mincer 0.0+upsamp(ktm), 1, 1, 411420, 0
afilt = aosc[0]*p7
;outs afilt, afilt
zaw afilt, p8
endin

instr 100 ;sequence
p3 = 64*60/gitempo
kzk0 metro gitempo/60 ;tempo trigger
printf "!!!!! %f, %f \n", int(kzk0/2), girnd[0], girnd[1]
;ametronome mpulse 32000, 60/gitempo
;ametronome lowpass2 ametronome, 2367, 5
;outs ametronome, ametronome
kzk0 *= linseg:k(1,p3,65)
zkw kzk0, 0
;-------------automation

gkauto[0] line 0, p3, 1

;-----------------------
event_i "i", 303, 1, 3, 411420, 2.55, 0.5, 2.35, 5000, 2, 10
event_i "i", 303, 2, 2, 411420, 1.45, 0.15, 1.70, 5000, 1, 11
event_i "i", 303, 5, 3, 411420, 0.25, 0.75, 1.65, 5000, 2, 10
event_i "i", 303, 6, 2, 411420, 0, 0.25, 0.25, 5000, 1, 11
event_i "i", 303, 9, 3, 411420, 0.25, 1.5, 1.65, 5000, 2, 10
event_i "i", 303, 10, 6, 411420, 0, 0.25, 0.25, 5000, 1, 11
event_i "i", 303, 13, 3, 411420, 2, 1.5, 1, 5000, 1.5, 10
event_i "i", 303, 14, 6, 411420, 1.65, 0.25, 0.25, 5000, .75, 11
event_i "i", 303, 20, 2, 411420, 0, 0.25, 0.25, 5000, 1, 11
event_i "i", 303, 22, 2, 411420, 0.50, 0.35, 0.65, 5000, 1, 10
event_i "i", 303, 24, 2, 411420, 1.75, 0.35, 2, 5000, 1, 11
event_i "i", 303, 26, 2, 411420, 1.25, 0.35, 1.65, 5000, 1, 11
event_i "i", 303, 21, 3, 411420, 2.55, 1.5, 2.35, 5000, 2, 10
event_i "i", 303, 27, 3, 411420, 0.25, 1.5, 1.65, 5000, 2, 10

event_i "i", 309, 14, 6.5, 4, 0, 0.5, 10500 ;sleighbell proccess
event_i "i", 309, 14, 1.3, 4, 0, 0.050, 2500 ;sleighbell proccess
event_i "i", 309, 21, 4.5, 4, .25, 1, 7500 ;sleighbell proccess
event_i "i", 309, 21, 4.5, 4, .75, 0, 7500 ;sleighbell proccess
event_i "i", 309, 19.5, 1.5, 0, .25, 0, 1500 ;sleighbell proccess
endin

instr 99
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 100, 0, 32
event_i "i", 8000, 0, 32
endin


instr 8000
iclimbft ftgenonce 0,0,16384,-7,0,16384,108
kclimb_0_108 oscili 1,1/(p3*100),iclimbft,-1
;ilmft ftgenonce 0,0,0dbfs*2,-7,-0dbfs,0dbfs*2,0dbfs
ilmft ftgenonce 0,0,0dbfs*2,"tanh",-25,25
;----------------ZR INPUTS------
printk2 zkr:k(0) ;print tempo clock
zkcl 0, 64
;----------------ZA INPUTS------
abypass zar 0
aza[] init 2
aza[0] zar 10
aza[1] zar 11
zacl 0, 64
;-----------------
;-----------------OUTPUT--------
outs abypass, abypass
asum = (aza[0])+(aza[1]);*(aza[0]*aza[0]*aza[0]*aza[0]*aza[0])*(.0006^6); huge self-modulation
asum *= 1
outs asum, asum
endin
         