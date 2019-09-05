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

instr 110
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 220, 0, 32
event_i "i", 8000, 0, 32
endin

instr 220
endin

instr 8000
abypass zar 0
outs abypass, abypass
zacl 0, 64
endin

</CsInstruments>
<CsScore>


{36 x
i110 [32*$x] 1
}

</CsScore>
</CsoundSynthesizer>