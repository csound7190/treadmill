
instr 304
p3 = 2.00 ;fix duration
;p5 = 8 ;shift index of mod
p6 *= 2 ;pitch octave up

	kex linseg 0, p3*.05, 0, p3*.05, 1
	kex tablei kex*.5, -1, 1, 0.25, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
	kex = (kex*.5)+.5
	kex port kex, .0035
	k_Amp = p4^kex

	kex linseg , 0, p3*.15, 1
	iphs = .75
	kex tablei kex*.5, -1, 1, iphs, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
	kex = (kex*.5)+.5
	kex port kex, .0005
	k_FmR = p5^kex

	kex linseg 0, p3*.75, 0, p3*.25, 1
	kex tablei kex*.5, -1, 1, .25, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
	kex = (kex*.5)+.5
	kex port kex, .0005
	k_FmP = p6^kex

	kex linseg 0, p3*.75, 0, p3*.25, 1
	kex tablei kex*.5, -1, 1, .25, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
	kex = (kex*.5)+.5
	kex port kex, .0005
	k_FmM = p7^kex
	
	kex linseg 0, p3*.75, 0, p3*.25, 1
	kex tablei kex*.5, -1, 1, .25, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
	kex = (kex*.5)+.5
	kex port kex, .0005
	k_FmC = p8^kex

aosc foscil k_Amp, k_FmP, k_FmC, k_FmM, k_FmR, -1
aosc += alpass(diff(aosc*4), 100/50, 8/50)
outs aosc, aosc
endin

instr 303 ;
iinitpitch = p5
ipitch = p4
iform_mod_amt = p6 ;should be 1 or more
iamp = p7
kex linseg 0, p3*.75, 0, p3*.25, 1
ke tablei kex*.5, -1, 1, .25, 1;= .5+oscil:k(.5,.5/p3,-1,0.25)
ke = (ke*.5)+.5
ke port ke, .0005
kamp = iamp^ke
ip8 = p8 ;zawm patch send
kcps init p4
kf port kcps, 0.021, p5
aosc[] init 3
aosc[0] fof 1, ipitch, zkr:k(p9), 0, 0, 0.002, 0.05, 0.03, 1000, -1, 606, p3 
;aosc[1] fof 1, ipitch*1.014, zkr:k(p9), 0, 0, 0.003, 0.015, 0.03, 1000, 606, 303, p3 
;aosc[2] fof 1, ipitch*.99987, zkr:k(p9), 0, 0, 0.003, 0.015, 0.03, 1000, 606, 303, p3 
afilt = (aosc[0]*kamp)+(aosc[1]*kamp)+(aosc[2]+kamp)
;outs afilt, afilt
zawm afilt, ip8
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
kform[] init 4
kform[0] expseg cpspch(8.09), p3/2, cpspch(12.09)
kform[1] expseg cpspch(10.04), p3/2, cpspch(12.11), 0.001, cpspch(10.04), p3/4, cpspch(13.04), p3/4, cpspch(10.02)
kform[2] linseg 54*15, p3/2, 54*15, p3/2, 54*15
kform[2] rspline 1000, 1670, .0625, 1
zkw kform[0], 0
zkw kform[1], 1
zkw kform[2], 2
;event_i "i", 303, 0,8, cpspch(7.02), 1100, 2, 400, 12, 0

event_i "i", 303, 0, 16, cpspch(7.09), 1100, 2, 300, 13, 1
event_i "i", 303, 16, 8, cpspch(8.09), 1100, 2, 300, 13, 1
event_i "i", 303, 24, 8, cpspch(8.09), 1100, 2, 300, 13, 1

event_i "i", 304, 0, 1, 3500, 0.5, 27, 1, 18
event_i "i", 304, 2, 0.5, 3500, 0.5, 27, 1, 8
event_i "i", 304, 3, 0.5, 3500, 0.5, 27, 1, 8
event_i "i", 304, 4, 0.5, 3500, 0.5, 27, 1, 8


event_i "i", 304, 6, 0.5, 3500, 0.5, 27, 1, 8
event_i "i", 304, 7, 0.5, 3500, 0.5, 27, 1, 7
event_i "i", 304, 8, 0.5, 3500, 0.5, 27, 1, 6

event_i "i", 304,10, 0.5, 3500, 0.5, 27, 1, 6
event_i "i", 304,11, 0.5, 3500, 0.5, 27, 1, 7

event_i "i", 304,13, 1, 3500, 0.5, 27, 1, 6
event_i "i", 304,14, 4, 3500, 0.5, 27, 1, 4
event_i "i", 304,15, 0.5, 1500, 0.5, 108, .5, 2.997


	;event_i "i", 304, 13, 0.125, 3500, 0.5, 27, 1, 16
	 ;event_i "i", 304, 13.117, 0.375, 3500, 0.5, 27, 1, 24
	
event_i "i", 304, 16, 0.5, 3500, 0.5, 27, 1, 9
event_i "i", 304, 17, 0.5, 3500, 0.5, 27, 1, 9
event_i "i", 304, 18, 0.5, 3500, 0.5, 27, 1, 7

event_i "i", 304, 20, 0.5, 3500, 0.5, 27, 1, 9
event_i "i", 304, 21, 0.5, 3500, 0.5, 27, 1.2, 9
event_i "i", 304, 22, 0.5, 3500, 0.5, 27, .25, 7

event_i "i", 304, 24, 0.5, 3500, 0.5, 27, .25, 9
event_i "i", 304, 25, 2, 3500, 0.5, 27, 1, 8
event_i "i", 304, 27, 4, 3500, 0.5, 27, 1, 4
event_i "i", 304, 26, 0.375, 1500, 3, 81, 1, 3


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

;-------------long-loop continual process
kgate oscili 3, 4*gitempo/60, -1, 0.25
kgate = .25^(3+kgate) ;between ^0 and ^6)

;----------------ZR INPUTS------
;printk2 zkr:k(0) ;print tempo clock
zkcl 0, 64
;----------------ZA INPUTS------
abypass zar 0
aza[] init 4
aza[0] zar 10
aza[1] zar 11
aza[2] zar 12
aza[3] zar 13
zacl 0, 64
;-----------------
;-----------------OUTPUT--------
outs abypass, abypass
agate = kgate*(aza[2]+aza[3])
asum = (aza[0])+(aza[1]);*(aza[0]*aza[0]*aza[0]*aza[0]*aza[0])*(.0006^6); huge self-modulation
asum *= 1
agate tablei agate*3, ilmft, 0, 0dbfs, 0 ;waveshaping
agate diff agate
agate lowpass2 agate, 1619, 50
agate_ alpass agate, 0.757, 0.04800
agate += -agate_
agate *= 500
asum += agate
outs asum, asum
endin
         