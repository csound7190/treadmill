<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
nchnls = 2
ksmps = 32

#include "opcodes.txt"

zakinit 64, 64

gitempo init 120

gifun init 50

girnd[] init 16

gkauto[] init 1

instr 99
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 100, 0, 32
event_i "i", 8000, 0, 32
endin

instr 100
endin

instr 8000
abypass zar 0
outs abypass, abypass
zacl 0, 64
endin

</CsInstruments>
<CsScore>
;-----sound input files
f 411420 0 [65536*8] 1 "411420.wav" 0 0 1
f 411421 0 [65536*4] 1 "sound1.wav" 0 0 1 ;mic crumple

;-----waveforms and things
f 303 0 16384 -7 0 16384 1 ;linear attack

f 304 0 16384 -16 0 16384 -3 1
f 304 0 16384 -16 0 16384 -2 1
f 304 0 16384 -16 0 16384 -1 1
f 304 0 16384 -16 0 16384 0 1
f 304 0 16384 -16 0 16384 1 1
f 304 0 16384 -16 0 16384 2 1
f 304 0 16384 -16 0 16384 3 1
f 606 0 16384 -7 -1 16384 1 ;sawtooth (aliasing)

{16 x
i99 [32*$x] 1
}

</CsScore>
</CsoundSynthesizer>