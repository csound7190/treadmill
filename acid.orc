

instr 303 ;acid. pfields(pitch, port initial pitch, filter rez)
irisft ftgenonce 0,0,16384,-7,0,16384,1
ke adsr 0.020, 0.025, 0.25, 0.040
kecf adsr 0.020, 0.025, 0.25, 0.040, 0.020
kcps init p4
kf port kcps, 0.010, p5
aosc[] init 3
aosc[0] fof 1, kcps, 1100, 0, 0, 0.001, 0.0050, 0.002, 108, -1, irisft, p3
afilt lowpass2 aosc[0], (p4*3)+(kefilt*p4*7), p6
afilt *= ke*p7
outs afilt, afilt
endin


instr 182 ;sequencer
i_count[] fillarray 0.25 0.50 0.625 0.875 1.0
i_ipitch[] fillarray 400,200,200,200,\
                      -1,-1,-1,-1,\
                       -1,-1,-1,-1,\
                        -1,-1,-1,-1,
i_fres[] fillarray 75, 25, 50, 25
i_amp[] fillarray 1900, 1000, 1100, 1100, 1900
i_out[]
i_pitch = 200
icount init 0
loop:
if (icount<16) then
;                                           p4      p5                  p6                p7               p8
event_i "i", 303, (1*icount)+i_count[icount%5], 0.120, ipitch, i_ipitch[icount%16], i_fres[icount%4], i_amp[icount%4], i_out[icount%5]
icount += 1
igoto loop
endif
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
i_onset[] fillarray 0,4,8,12,\
                     16,20,24,28,\
                      32,36,40,44,\
                       48,52,56,60;
i_dur = 0
i_call[] fillarray 182,182,1s82,182,\
                    182,182,182,182,\
                     182,182,182,182,\
                      182,182,182,182,
icount init 0
loop:
if (icount<16) then
event_i "i", i_call[icount%16], i_onset[icount%16]/4, 0
icount += 1
igoto loop
endif
endin


instr 8000
ilmft ftgenonce 0,0,0dbfs*2,-7,-0dbfs,0dbfs*2,0dbfs
printk2 zkr:k(0) ;print tempo clock
abypass zar 0
outs abypass, abypass
zacl 0, 64
endin