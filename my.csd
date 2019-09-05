<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
nchnls = 2
ksmps = 32

instr 1
ires compilecsd "my.csd"
print ires ; 0 as compiled successfully
event_i "i", 220, 0, 1
adone oscil 5000, 550
outs adone, adone
endin

instr 220
endin

</CsInstruments>
<CsScore>

{36 x
i1 [8*$x] 1
}
</CsScore>
</CsoundSynthesizer>