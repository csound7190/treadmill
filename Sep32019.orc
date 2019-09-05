instr 1
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 120, 0, 8
event_i "i", 220, 0, 1
event_i "i", 8000, 0, 8.0
endin

instr 120
kzk0 jspline 1, 0.20, 0.95
zkw kzk0, 0
kzk1 jspline 1, 0.20, 0.95
zkw kzk1, 1
endin

instr 220
event_i "i", 260, 0, 4
event_i "i", 2201, 0, 1
endin

instr 2201
ktrig metro 1/p3
schedkwhen ktrig, 0, 100, 242, 0.00, 1.5
schedkwhen ktrig, 0, 100, 240, 0.25, 1.5
schedkwhen ktrig, 0, 100, 242, 0.50, 1.5
schedkwhen ktrig, 0, 100, 240, 0.75, 1.5
schedkwhen ktrig, 0, 100, 242, 1.00, 1.5
schedkwhen ktrig, 0, 100, 240, 1.25, 1.5
schedkwhen ktrig, 0, 100, 242, 1.50, 1.5
schedkwhen ktrig, 0, 100, 240, 1.75, 1.5
schedkwhen ktrig, 0, 100, 242, 2.00, 1.5
schedkwhen ktrig, 0, 100, 240, 2.25, 1.5
schedkwhen ktrig, 0, 100, 242, 2.50, 1.5
schedkwhen ktrig, 0, 100, 240, 2.75, 1.5
schedkwhen ktrig, 0, 100, 242, 3.00, 1.5
schedkwhen ktrig, 0, 100, 240, 3.25, 1.5
schedkwhen ktrig, 0, 100, 242, 3.50, 1.5
schedkwhen ktrig, 0, 100, 240, 3.75, 1.5
schedkwhen ktrig, 0, 100, 242, 4.00, 1.5
schedkwhen ktrig, 0, 100, 240, 4.25, 1.5
schedkwhen ktrig, 0, 100, 242, 4.50, 1.5
schedkwhen ktrig, 0, 100, 240, 4.75, 1.5
schedkwhen ktrig, 0, 100, 242, 5.00, 1.5
schedkwhen ktrig, 0, 100, 240, 5.25, 1.5
schedkwhen ktrig, 0, 100, 242, 5.50, 1.5
schedkwhen ktrig, 0, 100, 240, 5.75, 1.5
schedkwhen ktrig, 0, 100, 242, 6.00, 1.5
schedkwhen ktrig, 0, 100, 240, 6.25, 1.5
schedkwhen ktrig, 0, 100, 242, 6.50, 1.5
schedkwhen ktrig, 0, 100, 240, 6.75, 1.5
schedkwhen ktrig, 0, 100, 242, 7.00, 1.5
schedkwhen ktrig, 0, 100, 240, 7.25, 1.5
schedkwhen ktrig, 0, 100, 242, 7.50, 1.5
schedkwhen ktrig, 0, 100, 240, 7.75, 1.5
endin

instr 240
ke expseg 0.00005, 0.012, random:i(37000,54000), random:i(.75,.85), .100
anz unirand ke
anz butbp anz, random:i(10000,12000), 100
anz = anz/128
anz = 128*int(anz)
ilmft ftgenonce 0,0,0dbfs*2,-8,-0dbfs,0dbfs*2,0dbfs
anzlm tablei anz*6, ilmft, 0, 0dbfs, 1
zaw anzlm, 0
endin

instr 242
p3 = 0.220
ke expseg 5000, p3, 0.00005
aosc oscil ke, expseg(20000,0.020,60)
zaw aosc, 0
endin

instr 260
xtratim 2.50
ift ftgenonce 0,0,0,1,"182119.wav",0,0,0
ar1, ar2 loscil 50, 1, ift, 1, 0, sr*0.50, sr*1.00
zaw ar1, 4
zaw ar2, 5
endin

instr 8000
kzk0 zkr 0
printk .25, kzk0
kzk1 zkr 1
printk .25, kzk1
abypass zar 0
outs abypass, abypass
ach1L zar 4
ach1L zar 5
ach1L mode ach1L, 1200, 1000
ach1R mode ach1L, 3000, 1000
adelL init 0
adelR init 0
adelL delay ach1L+(adelR*.75), 0.75/2
adelR delay ach1R+(adelL*.75), 0.75/2
outs ach1L+adelL, ach1L+adelR
zacl 0, 64
endin
