
instr 1
ires compileorc "my.orc"
print ires ; 0 as compiled successfully
event_i "i", 220, 0, 32
event_i "i", 8000, 0, 32
endin

instr 220
p3 = 64*60/gitempo
kzk0 metro gitempo/60
kzk0 *= linseg:k(1,p3,65)
zkw kzk0, 0
event_i "i", 330, 0, 4
event_i "i", 330, 16, 4
endin

instr 8000
printk2 zkr:k(0)
abypass zar 0
outs abypass, abypass
zacl 0, 64
endin
