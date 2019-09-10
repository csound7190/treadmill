

instr 303 ;acid. pfields(pitch, port initial pitch, filter rez)
ires = p7
ip8 = p8
ke adsr 0.0050, 0.025, 0.35, 0.040
kecf adsr 0.010, 0.025, 0.75, 0.040
kcps init p4
kf port kcps, 0.021, p5
aosc[] init 3
aosc[0] gbuzz 1, kf, 9,3, 0.50*kecf, -1
;afilt lowpass2 aosc[0]*ke*p7, 500+(1500*kecf), ires
afilt = aosc[0]*ke*p7
;outs afilt, afilt
zaw afilt, p8
endin


instr 182 ;sequencer
i_pitch[] fillarray 200,200,200,200,\
                     400,200,300,300,\
                      200,200,200,200,\
                       100,300,400,400
i_ipitch[] fillarray 400,200,200,200,\
                      200,200,400,200,\
                       100,-1,-1,-1,\
                        -1,-1,100,-1
i_fres[] fillarray 50,0,0,0
i_amp[] fillarray 4500, 1100, 1100
i_out[] fillarray p4

icount init 0
loop:
if (icount<16) then
;                                       p4                 p5                  p6                p7               p8
event_i "i", 303, 0.125*icount, 0.120, i_pitch[icount%16], i_ipitch[icount%16], i_fres[icount%4], i_amp[icount%3], i_out[icount%1]
icount += 1
igoto loop
endif
endin


instr 183 ;sequencer
i_pitch[] fillarray 600,1200,300,600,\
                     150,400,300,300,\
                      300,900,300,450,\
                       600,300,400,400
i_ipitch[] fillarray 1800,150,300,200,\
                      -1,-1,-1,-1,\
                       1500,-1,-1,-1,\
                        600,900,600,300
i_fres[] fillarray 50,0,0,0
i_amp[] fillarray 4500, 1100, 1100
i_out[] fillarray p4

icount init 0
loop:
if (icount<16) then
;                                       p4                 p5                  p6                p7               p8
event_i "i", 303, 0.125*icount, 0.120, i_pitch[icount%16], i_ipitch[icount%16], i_fres[icount%4], i_amp[icount%3], i_out[icount%1]
icount += 1
igoto loop
endif
endin

instr 184
event_i "i", 303, 0.125, 0.440, 600, 9600, 90, 1800, p4
endin

instr 100 ;sequence of sequences
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
i_dur = 0
i_call[] fillarray 182,182,182,182,\
                    182,182,182,182,\
                     182,182,182,182,\
                      182,182,182,182
icount init 0
loop:
if (icount<15) then
;event_i "i", 184, 0, 0, 11
;event_i "i", i_call[icount%16]+1, 1.009+icount*2, 0, 11
event_i "i", i_call[icount%16], icount*2, 0, 10
icount += 1
igoto loop
endif
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
k_amt_ws = 1+kclimb_0_108+oscil:k(kclimb_0_108*.90,gitempo/3840,-1,0.25)
printk 1, k_amt_ws,50
asum table asum*k_amt_ws, ilmft, 0, 0dbfs, 0
asum lowpass2 asum, 6500+oscil:k(800,0.0625*gitempo/60,-1,0.25), 95
asum *= 840
outs asum, asum
endin
         