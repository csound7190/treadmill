
<CsoundSynthesizer>
<CsLicense>
</CsLicense>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr=44100
ksmps=8
nchnls=1


ga0 init 0
ga1 init 0

gkrms init 0

gkaccela init 10
gkaccelb init 10
gkaccelc init 10

instr 1100
gkaccela chnget "accelerometerX"
gkaccela *= 1
;printk .5, gkaccela, 4
gkaccelb chnget "accelerometerY"
gkaccelb *= 1
;printk .5, gkaccelb, 8
gkaccelc chnget "accelerometerZ"
;gkaccelc *= 1
printk .5, gkaccelc, 12
endin

instr 1
ktrig metro 144/15
kndx phasor p9/p3
kgate table kndx, 101, 1
schedkwhen ktrig*kgate, 0, 200, p4, 0, p5
kgate table kndx, 102, 1
schedkwhen ktrig*kgate, 0, 210, p6, 0, p7, p8
endin 
instr 2
ktrig metro 144/15
kndx phasor p9/p3
kgate table kndx, 101, 1
schedkwhen ktrig*kgate, 0, 210, p4, 0, p5
ktrig metro 144/15, .15
kgate table kndx, 102, 1
schedkwhen ktrig*kgate, 0, 210, p6, 0, p7, p8
endin

instr 3 ;the sound
ktrig metro 144/15
kndx phasor p9/p3
kgate table kndx, 101, 1
schedkwhen ktrig*kgate, 0, 10, p4, 0, p5
ktrig metro 144/15
ktrig2 metro 144/15, .075
kgate table kndx, 102, 1
schedkwhen ktrig*kgate, 0, 10, p6, 0, p7, p8
endin

instr 4; a sequence
ktrig metro 144/15
kndx phasor p9/p3
iseq ftgen 0,0,8,-2,p4,p4,p4,p4+2,p4,p4,p4,p4+1
kseqndx phasor .125*p9/p3
kseq table kseqndx, iseq, 1
kgate table kndx, 101, 1
schedkwhen ktrig*kgate, 0, 200, kseq, 0, p5
kgate table kndx, 102, 1
schedkwhen ktrig*kgate, 0, 210, p6, 0, p7, p8
endin

;-------------BASSES BEGIN---------------;

instr 17
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
;aosc1 tone aosc1*ke, 1555
out aosc1*ke/3
endin

instr 18
ke expseg 0.00001, .001, 3, .35, .00001
aosc1 vco2 10000, 25*144/60,0,0,0
kefc expseg 6555, .35, 1005
aosc1 butlp aosc1*ke, kefc
aosc1 tone aosc1*ke, kefc
out aosc1*ke/3
endin

instr 19
ke transeg 0, .001, 2, 3, .27, 0, 0
aosc1 vco2 10000, .0625*25*144/60,0,0,0
aosc1 tone aosc1*ke, 1555
out aosc1*ke/2
endin

instr 20
ke expseg 0.00001, .001, 3, .17, .00001
kepw expseg .5, .018, .97
aosc1 vco2 10000, 25*144/60,2,.5,0
;aosc1 tone aosc1*ke, 1555
out aosc1*ke/3
endin

instr 21
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 vco2 1000, 25*144/60,4,.01,0
;aosc1 tone aosc1*ke, 1555
out aosc1*ke/3
endin

instr 22
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 vco2 10000, 25*144/60,4,.5,0
;aosc1 tone aosc1*ke, 1555
out aosc1*ke/3
endin

instr 23
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 vco2 10000, 25*144/60,8,.5,0
;aosc1 tone aosc1*ke, 1555
out aosc1*ke
endin

instr 24
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 moogvcf aosc1*ke/3, kefc, 0.05, 0dbfs
out aosc1
endin

instr 25
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 moogvcf aosc1*ke/3, kefc, 0.75, 0dbfs
out aosc1
endin

instr 26
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 tone aosc1*ke/3, kefc
aosc1 tone aosc1, kefc
out aosc1
endin

instr 27
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 tone aosc1*ke/3, kefc
aosc1 tone aosc1, kefc
out aosc1
endin

instr 28
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1 fofilter aosc1*ke/3, 4*25*144/60,.03,.07
out aosc1
endin

instr 29
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1 fofilter aosc1*ke/3, 6*25*144/60,.03,.07
out aosc1
endin

instr 30
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1 fofilter aosc1*ke/3, 8*25*144/60,.03,.07
out aosc1
endin

instr 31
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1 fofilter aosc1*ke/3, 8*25*144/60,.02,.035
out aosc1
endin

instr 32
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1a fofilter aosc1*ke/3, 4*25*144/60,.03,.07
aosc1b fofilter aosc1*ke/3, 6*25*144/60,.03,.07
aosc1c fofilter aosc1*ke/3, 8*25*144/60,.03,.07
out .333*(aosc1a+aosc1b+aosc1c)
endin

instr 33
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1a fofilter aosc1*ke/3, 3*25*144/60,.03,.07
aosc1b fofilter aosc1*ke/3, 5*25*144/60,.03,.07
aosc1c fofilter aosc1*ke/3, 7*25*144/60,.03,.07
out .333*(aosc1a+aosc1b+aosc1c)
endin

instr 34
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/25
aosc1a fofilter aosc1*ke/3, 350,.03,.07
aosc1b fofilter aosc1*ke/3, 440,.03,.07
aosc1c fofilter aosc1*ke/3, 590,.03,.07
out .333*(aosc1a+aosc1b+aosc1c)
endin

instr 35
ke expseg 0.00001, .001, 3, .17, .00001
aosc1 mpulse 10000, (60/144)/100
aosc1a fofilter aosc1*ke/3, 5*25*144/60,.03,.07
aosc1b fofilter aosc1*ke/3, 9*25*144/60,.03,.07
aosc1c fofilter aosc1*ke/3, 13*25*144/60,.03,.07
out .333*(aosc1a+aosc1b+aosc1c)
endin

instr 36
ke expseg 0.00001, .001, 3, .23, 3
keptch expseg 0.00001, .001, 1
aosc1 mpulse 10000, keptch*(60/144)/25
aosc1 tone aosc1*ke/3, 1357
out aosc1
endin

instr 37
ke expseg 0.00001, .001, 3, .23, 3
keptch expseg 0.00001, .001, 1
aosc1 vco2 10000, keptch*(60/144)/25,0,0,0
aosc1 tone aosc1*ke/3, 1357
out aosc1
endin

instr 38
ke expseg 0.00001, .001, 3, .27, 3
keptch expseg 0.00001, .0025, 1
aosc1 vco2 10000, keptch*(60/144)/25,0,0,0
aosc1 tone aosc1*ke/3, 1357
out aosc1
endin

instr 39
ke expseg 0.00001, .001, 3, .27, 3
keptch expseg 0.5, .001, 1
keptch2 expseg 1, .171, .5
aosc1 vco2 10000, keptch*keptch2*(60/144)/25,0,0,0
aosc1 tone aosc1*ke/3, 1357
out aosc1
endin

instr 40
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0,.075
kefc expseg 155, .001, 3555, .1, 155
aosc1 moogvcf aosc1*ke/3, kefc, 0.05, 0dbfs
out aosc1
endin

instr 41
aplck pluck 10000, 25*144/60, 25*144/60, 0, 1
out aplck
endin

instr 42
icps = 25*144/60
aplck pluck 10000, icps, icps*4, 0, 1
out aplck
endin

instr 43
icps = 25*144/60
aplck pluck 10000, icps, icps*16, 0, 1
out aplck
endin

instr 44
icps = 25*144/60
aplck pluck 10000, icps, icps*64, 0, 1
out aplck
endin

instr 45
ke expseg 0.00001, .001, 3, .12027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps, 303, 0
aplck *= (ke^1)
adry = aplck
ilh random 3,5
aplck gbuzz 750* (ke^1), icps, 2, ilh, .89, 303
afb init 0
adel delay aplck+afb, 45/144
afb butlp adel, 4000
asum alpass adry+(aplck+adel)/4, .013, .0015
;asum tone asum, 250
out asum
endin

instr 46
ke expseg 0.00001, .001, 3, .12027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps, 303, 0
aplck *= (ke^1)
adry = aplck
ilh random 4,7
aplck gbuzz 750* (ke^1), icps, 2, ilh, .89, 303
afb init 0
adel delay aplck+afb, 45/144
afb butlp adel, 4000
asum alpass adry+(aplck+adel)/4, .013, .0013
;asum tone asum, 250
out asum
endin

instr 47
ke expseg 0.00001, .001, 3, .12027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps, 303, 0
aplck *= (ke^1)
adry = aplck
ilh random 6,9
aplck gbuzz 750* (ke^1), icps, 2, ilh, .89, 303
afb init 0
adel delay aplck+afb, 45/144
afb butlp adel, 4000
asum alpass adry+(aplck+adel)/4, .013, .0010
;asum tone asum, 250
out asum
endin

instr 48
ke expseg 0.00001, .001, 3, .12027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps, 303, 0
aplck *= (ke^1)
adry = aplck
ilh random 8,11
aplck gbuzz 750* (ke^1), icps, 2, ilh, .89, 303
afb init 0
adel delay aplck+afb, 45/144
afb butlp adel, 4000
asum alpass adry+(aplck+adel)/4, .013, .0011
;asum tone asum, 250
out asum
endin

instr 49
ke expseg 0.00001, .001, 3, .10027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps/(1.11), -1, 0
aplck *= (ke^1)
asub = aplck
aplck gbuzz 750*(ke^1), icps, 8, 2, .39, 300
asum alpass aplck+asub, .013, .0015
asum tone asum, 250
asum tone asum, 250
out asub
endin

instr 50
ke expseg 0.00001, .001, 3, .10027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps/(1.11), -1, 0
aplck *= (ke^1)
asub = aplck
aplck gbuzz 750*(ke^1), 3*icps, 3, 2, .39, 300
asum alpass aplck+asub, .013, .0015
asum tone asum, 250
asum tone asum, 250
out asub
endin

instr 51
ke expseg 0.00001, .001, 3, .10027, 0.10
icps = 19*144/60
aplck poscil3 3000, icps/(1.11), -1, 0
aplck *= (ke^1)
asub = aplck
aplcka mpulse 10, 1/icps
aplcka fold aplcka, random(1,26)
aplcka atone aplcka, 134
aplck gbuzz 750*(ke^1), 3*icps, 3, 0, .39, 300
asum alpass asub+aplcka, .043, .0015
asum tone asum, 250
asum tone asum, 250
out asub
endin

instr 52
ke expseg 0.00001, .020, .0000001, .001, 3, .215027, 0.00010
icps = 19*144/60
ix random 243, 272
aplck poscil3 3000, icps*(ix/243), -1, .333
aplck *= (ke^1)
asub = aplck
ix random 3, 4
ke linseg 0, .001, 1, .033, 1, 0, 0, p3-.024, 0
aplcka mpulse 900*(ke), .5/icps
aplcka reson aplcka, int(ix)*icps, icps*ix*.345
aplcka moogvcf aplcka, 8*icps, .05, 0dbfs
;aplcka tone aplcka, icps
out aplcka
endin

instr 53
ke expseg 0.00001, .001, 3, .36, .00001
ke2nd linseg 0, .004, 0, 0, 1, p3-.054, 1
icps = 19*144/60
ifnscale ftgenonce 0,0,8,-2,1,9/8,5/4,4/3,3/2,256/243,7/8,9/8
ioct random 0,0
inote random 0, 8
inote table int(inote), ifnscale, 0, 0, 1
printk .2, inote
aosc1 mpulse 45000, 1/(icps*inote*(2^ioct))
fsiga pvsanal aosc1, 1024, 256, 1024, 1
aout pvsadsyn fsiga, 8, 9, 2, 1
ke2nd linseg 0, .078, 0, 0, 1, p3-.074, 1
asub poscil3 13000, icps, -1, .333
out  (asub*ke/3)+aout
endin

instr 54
ke expseg 0.00001, .001, 3, .36, .00001
ke2nd linseg 0, .054, 0, 0, 1, p3-.054, 1
ke3rd = 1-ke2nd
kefil expseg .001,.006,(.05),.020,.05,.004,.001
kefil=.98
icps = 32*144/60
aosc1 poscil -10000*ke*ke3rd, icps
aosc2 vco2 10000*ke*ke3rd, icps, 0, 0, 0
out aosc1+aosc2
endin

instr 55
ke expseg 0.00001, .001, 3, .004, 3, .002, .00001
icps = 35*32
aosc2 vco2 3000*ke, icps, 0, .5, 0
aosc2 alpass aosc2, random:i(.400, .810), 1/35
out aosc2
endin

instr 56
ke expseg 0.00001, .001, 3, .004, 3, .002, .00001
icps = 35*32
aosc2 vco2 3000*ke, icps, 0, .5, 0
aosc2 alpass aosc2, random:i(.400, .810), 1/17.5
out aosc2
endin

instr 57
ke expseg 0.00001, .001, 3, .004, 3, .002, .00001
icps = 36*36*144/60
kfm oscili .15, .20, -1, -1
aosc2 vco2 3000*ke, icps, 0, .5, 0
aosc3 vco2 3000*ke, icps*(1+kfm), 0, .5, 0
aosc2 alpass aosc2+aosc3, random:i(.400, .810), 144/icps
out aosc2
endin

instr 58
ke expseg 0.00001, .001, 3, .004, 3, .002, .00001
icps = 36*36*144/60
kfm oscili 5, .353, -1, -1
aosc2 vco2 3000*ke, icps*(1+kfm), 0, .5, 0
aosc3 vco2 3000*ke, icps*1.625*(1), 0, .5, 0
aosc4 vco2 3000*ke, icps*2.5*(1), 0, .5, 0
aosc2 alpass aosc2+aosc3+aosc4, random:i(.100, .610), 3/35
aosc2 alpass aosc2/8, .084, 1/35
out aosc2/10
endin

instr 59
ke expseg 0.00001, .001, 3, .004, 3, .202, .00001
icps = 36*144/60
kfm oscili .5, icps*8, -1, -1
aosc2 vco2 3000*ke, icps, 0, .5, 0
kefc linseg icps*30, .070, icps
aosc2 butlp aosc2, kefc
aosc2 moogvcf aosc2, icps*9+oscil:k(icps*4,.3,-1,-1),.35,0dbfs
out aosc2*10
endin

instr 60
icps = 25*144/60
kndx expseg 1/7, p3, 1/27
kcps oscil .96, icps*2
kcps oscil .96, icps*(1+kcps)/2
aplck pluck 10000, icps*(1+kcps), icps*4, 0, 1
kefc linseg 12000, p3, 1750
aplck atone aplck, kefc
aplck atone aplck, kefc
out aplck
endin

instr 61
icps = 25*144/60
kndx expseg 1/7, p3, 1/27
kcps oscil .96, icps*2
kcps oscil .96, icps*(1+kcps)/2
aplck pluck 10000, icps*(1+kcps), icps*4, 0, 1
kefc linseg 12000, p3, 1750
aplck atone aplck, kefc
aplck atone aplck, kefc
aplck moogvcf aplck, 13000-kefc, 0, 0dbfs
out aplck
endin

instr 62
icps = 25*144/60
kpe1 expseg 1, .1250, 2
kcps oscil .86, icps*2*kpe1
kcps oscil .86, icps*(kpe1)*(kcps)
aplck pluck 10000, icps*(1+kcps), icps, 0, 1
out aplck
endin

instr 63
icps = 8*25*144/60
kpe1 expseg 1, .1250, 2
acps pluck 0.85, icps*(7)*(1), icps, 0, 1
;acps butlp acps, 220
acps fold acps, 120
kcps downsamp acps
aplck pluck 6000, icps*(1+kcps)*(5), icps, 0, 1
aplck fold aplck, random:i(1,7)
ke linseg 1, .110, 1, 0, 0, p3, 0
aplck *= ke
aalpass alpass aplck, .250, 12/icps
adel init 0
adel delay aplck+(.5*adel), 45/144
aplck += adel*.125
aplck atone aplck, 1600
aplck buthp aplck, 600
out aplck+aalpass
endin

instr 64
icps = 8*25*144/60
kpe1 expseg 1, .1250, 2
acps pluck 0.9985, icps*(.0625)*(1), icps, 0, 1
;acps butlp acps, 220
acps fold acps, 120
kcps downsamp acps
aplck pluck 6000, icps*(1+kcps)*(1), icps, 0, 1
aplck fold aplck, random:i(6,15)
ke linseg 1, .180, .25, 0, 0, p3, 0
aplck *= ke
adel init 0
adel comb aplck+(.5*adel), 45/144, 45/144
adel buthp adel, 1200
adel diff adel
aplck += adel
aplck atone aplck, 3600
amode1 mode aplck, icps*16, 76
amode2 mode aplck, icps*8.216, 76
out (amode1+amode2)*2
endin

instr 65
icps = 25*144/60
kpe1 oscili .45, .6, -1, .25
kcps oscil 0.3985, icps*(3)*(1+kpe1), -1, 0
kpe2 linseg 1, .065, 1, .100, 1
aplck vco2 6000, kpe2*icps*(1+kcps)*(1), 0, .5, .5, .45
ke transeg 1, .100, -2, .065, 0, 0, 0, p3, 0, 0
aplck *= ke
amode1 mode aplck, icps*19, 16
amode2 mode aplck, icps*(16), 12
asum = (amode1)/10;+(amode2)/11
;asum moogvcf asum, icps*19, .75, 0dbfs
out asum
endin

instr 66
icps = 25*144/60
kpe1 oscili .45, .6, -1, .25
kcps oscil 0.3985, icps*(3)*(1+kpe1), -1, 0
kpe2 linseg 1, .065, 1, .100, 1
aplck vco2 6000, kpe2*icps*(1+kcps)*(1), 0, .5, .5, .45
ke transeg 1, .100, -2, .065, 0, 0, 0, p3, 0, 0
aplck *= ke
anz noise 1200*ke, -.99
amode1 mode aplck+anz, icps*19, 16
amode2 mode aplck, icps*(16), 12
asum = (amode1)/10;+(amode2)/11
;asum moogvcf asum, icps*19, .75, 0dbfs
out asum
endin

instr 67
icps = 25*144/60
kpe1 oscili .45, .6, -1, .25
kcps oscil 0.3985, icps*(3)*(1+kpe1), -1, 0
kpe2 linseg 1, .065, 1, .100, 1
aplck vco2 6000, kpe2*icps*(1+kcps)*(1), 0, .5, .5, .45
ke transeg 1, .100, -2, .065, 0, 0, 0, p3, 0, 0
aplck *= ke
asub oscili 9000*ke, icps*1.125
amode1 mode aplck, icps*19, 16
amode2 mode aplck, icps*(16), 12
asum = (amode1)/10;+(amode2)/11
;asum moogvcf asum, icps*19, .75, 0dbfs
out asum+asub
endin

instr 68
icps = 25*144/60
ke transeg 1, .100, -2, .065, 0, 0, 0, p3, 0, 0
asub oscili 18000*ke, icps
anz noise 1500*ke, -.99
amode1 mode anz, icps*19, 84
amode2 mode anz, icps*(16), 84
asum = (amode1)/10+(amode2)/11
;asum moogvcf asum, icps*19, .75, 0dbfs
out asub+asum
endin

instr 69
p3 = .180
icps = 25*144/60
ke transeg 1, .070, -2, .25, 0, 0, 0, p3, 0, 0
aplck vco2 1800*ke, icps, 0, .5, .5, .5
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
anz comb anz, 144/60, 10/144
anz pinkish anz
amode1 moogladder anz+aplck, icps*7, .85, 0dbfs
amode2 moogladder anz+aplck, icps*13, .85, 0dbfs
asum = (amode1)/1+(amode2)/1
;asum moogvcf asum, icps*19, .75, 0dbfs
ke transeg 1, .200, -7, 1, 0, 0, 0, p3, 0, 0
out ke*(asum+diff(anz))
endin

instr 70
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz comb anz, 1, 5/144
anz *= ke1
amode1 mode anz, icps*19, 16
amode2 mode anz, icps*37, 8
asum = (amode1)/1+(amode2)/1
out asum
endin

instr 71
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
;anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
amode1 mode anz, icps*1, random(16,128)
amode2 mode anz, icps*4.065,  random(16,128)
amode3 mode anz, icps*5, random(16,64)
amode4 mode anz, icps*7, random(16,64)
amode5 mode anz, icps*8.01, random(16,32)
amode6 mode anz, icps*10, random(16,32)
amode7 mode anz, icps*11, random(16,32)
amode8 mode anz, icps*12, random(16,32)
ke expseg 0.00001, .001, 3, .25, .00001
aosc1 vco2 10000, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 moogvcf aosc1*ke/3, kefc, 0.05, 0dbfs
asum = aosc1+(amode1)/1+(amode2)/1+(amode3)/1+(amode4)/1+(amode5)/1+(amode6)/1+(amode7)+(amode8)/2
out 0+asum+delay(diff(diff(asum)),.005)
endin

instr 72
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
;anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
icps *= 11
amode1 mode anz, icps*1, random(16,128)
amode2 mode anz, icps*4.065,  random(16,128)
amode3 mode anz, icps*5, random(16,64)
amode4 mode anz, icps*7, random(16,64)
amode5 mode anz, icps*8.01, random(16,32)
amode6 mode anz, icps*10, random(16,32)
amode7 mode anz, icps*11, random(16,32)
amode8 mode anz, icps*12, random(16,32)
ke expseg 0.00001, .001, 3, .25, .00001
icps *= 1/9
aosc1 vco2 1000*ke, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
;aosc1 moogvcf 1*aosc1*ke/3, kefc, 0.05, 0dbfs
asum = aosc1+(amode1)/1+(amode2)/1+(amode3)/1+(amode4)/1+(amode5)/1+(amode6)/1+(amode7)+(amode8)/2
out 0+asum+delay(diff(diff(asum)),.005)
endin

instr 73
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
;anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
irand random 1, 11
icps *= int(irand)
amode1 mode anz, icps*1, random(16,128)
amode2 mode anz, icps*4.065,  random(16,128)
amode3 mode anz, icps*5, random(16,64)
amode4 mode anz, icps*7, random(16,64)
amode5 mode anz, icps*8.01, random(16,32)
amode6 mode anz, icps*10, random(16,32)
amode7 mode anz, icps*11, random(16,32)
amode8 mode anz, icps*12, random(16,32)
ke expseg 0.00001, .001, 3, .25, .00001
icps *= 1/irand
aosc1 vco2 1000*ke, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
;aosc1 moogvcf 1*aosc1*ke/3, kefc, 0.05, 0dbfs
asum = aosc1+(amode1)/1+(amode2)/1+(amode3)/1+(amode4)/1+(amode5)/1+(amode6)/1+(amode7)+(amode8)/2
out 0+asum+delay(diff(diff(asum)),.005)
endin

instr 74
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
;anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
irand random 1, 3
icps *= int(irand)
amode1 mode anz, icps*1, random(4,32)
amode2 mode anz, icps*5,  random(8,32)
amode3 mode anz, icps*6, random(16,64)
amode4 mode anz, icps*7, random(16,64)
amode5 mode anz, icps*10, random(16,128)
amode6 mode anz, icps*12, random(16,128)
amode7 mode anz, icps*13, random(64,255)
amode8 mode anz, icps*14, random(64,255)
ke expseg 0.00001, .001, 3, .25, .00001
icps *= 1/irand
aosc1 vco2 1000*ke, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
;aosc1 moogvcf 1*aosc1*ke/3, kefc, 0.05, 0dbfs
asum = (amode1)/1+(amode2)/1+(amode3)/1+(amode4)/1+(amode5)/1+(amode6)/1+(amode7)+(amode8)/2
kde transeg 0, .208, random(-3,3),random(1,3)
asum vdelay asum, kde, 1
out 0+asum
endin

instr 75
icps = 25*144/60
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
;anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
irand random 0,3
icps *= 2^int(irand)
amode1 mode anz, icps*1, random(4,32)
amode2 mode anz, icps*5,  random(8,32)
amode3 mode anz, icps*6, random(16,64)
amode4 mode anz, icps*7, random(16,64)
amode5 mode anz, icps*10, random(16,128)
amode6 mode anz, icps*22, random(16,128)
amode7 mode anz, icps*85, random(64,255)
amode8 mode anz, icps*86, random(64,255)
ke expseg 0.00001, .001, 3, .25, .00001
icps *= 1/irand
aosc1 vco2 1000*ke, 25*144/60, 0,0,0
kefc expseg 155, .001, 3555, .1, 155
aosc1 moogvcf 1*aosc1*ke/3, kefc, 0.05, 0dbfs
asum = aosc1+(amode1)/1+(amode2)/3+(amode3)/3+(amode4)/10000+(amode5)/10000+(amode6)/2+(amode7)/2+(amode8)/2
kde transeg 0, .108, random(1,4), random(0,90)
asum vdelay asum, kde, 1000
anz valpass diff(anz), .0500, .0001+kde/1000, 1
out diff(anz)/2+asum
endin

instr 76
ke transeg 1, .004, -7, .25, 0, 0, 0, p3, 0, 0
anz noise 3800*ke, -.95
anz pinkish anz
ke1 linseg .001, .010, 1, .080, .001
anz *= ke1
kde transeg 0, .208, random(1,1), random(0,10), 107,2,20
anz vcomb diff(anz), .1500, .003+kde/1000, 1
anz vcomb diff(anz), .0600, .002+kde/1000, 1
anz reson anz, 8600, 3000
out anz/1
endin

instr 77
icps = 25*144/60
kea transeg 0, .002, 0, 1
ke transeg 1, .180, -2, 0
icfn ftgenonce 0,0,16384,16,1,30,0,-1
aimp mpulse 10000*ke*kea, 1/icps
timout .200, p3-.1200, skip
aimp dconv aimp, random(2,30), icfn
skip:
out aimp
endin

instr 78
icps = 25*144/60
kea transeg 0, .002, 0, 1
ke transeg 1, .180, -4, 0
icfn ftgenonce 0,0,16384,16,1,030,0,-1
aimp mpulse 10000*ke*kea, 1/icps
;timout .200, p3-.1200, skip
;aimp dconv aimp, 1200, icfn
skip:
amode1 mode aimp, icps*9, 10
amode2 moogvcf aimp, icps*7, .807, 0dbfs
aimp = amode1+amode2
out aimp
endin

instr 79
icps = 25*144/60
ke transeg 1, .150, -4, 0
anz noise 10000*ke, -.90
am1 mode anz, icps*24, 20
am2 mode anz, icps*48, 20
anz pinkish anz
anz butbp anz, icps*48, icps*8
out anz
endin

instr 80
icosfn ftgenonce 0,0,8192,11,1
icps = 50*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
kef transeg 2, .050, 1, .5
ao1 gbuzz 8000*ke*ka, icps, 7, 1, .15*kef, icosfn
ao2 gbuzz 8000*ke*ka, icps, 10, 8, 1*kef, icosfn
ao3 gbuzz 2000*ke*ka, icps, 35, 18, .5*kef, icosfn
asum = ao1+ao2+ao3
out asum
skip:
endin

instr 81
icosfn ftgenonce 0,0,8192,11,1
icps = 50*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
kef transeg 2, .050, 1, 1
ir1 random 2, 6
ir2 random 8, 12
ao1 gbuzz 8000*ke*ka, icps, ir1, 1, .15*kef, icosfn
ao2 gbuzz 8000*ke*ka, icps, ir2, ir1+1, 1*kef, icosfn
ao3 gbuzz 2000*ke*ka, icps, 35, ir1+ir2+1, .5*kef, icosfn
asum = ao1+ao2+ao3
out asum
skip:
endin

instr 82
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
icps *= 1/int(random(1,3))
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
kef transeg 2, .050, 1, .5
ao1 gbuzz 8000*ke*ka, icps, 4, 1, .15*kef, icosfn
ao2 gbuzz 8000*ke*ka, icps, 9, 6, 1*kef, icosfn
ao3 gbuzz 2000*ke*ka, icps, 35, 15, .5*kef, icosfn
asum = ao1+ao2+ao3
out asum
skip:
endin

instr 83
icosfn ftgenonce 0,0,8192,11,1
icps = 50*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
kef transeg 1, .050, 1, .5
ao1 gbuzz 8000*ke*ka, icps, 8, 1, .5*kef, icosfn
ao2 gbuzz 2000*ke*ka, icps, 4, 9, 1.5, icosfn
ao3 gbuzz 2000*ke*ka, icps, 4, 13, .75, icosfn
asum = ao1+ao2+ao3
out asum
skip:
endin

instr 84
icosfn ftgenonce 0,0,8192,11,1
icps = 50*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 10, 49
ao1 gbuzz 8000*ke*ka, icps, ir1, 1, .9, icosfn
asum = ao1
out asum
skip:
endin

instr 85
icosfn ftgenonce 0,0,8192,11,1
icps = 50*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random -3,3
kef transeg  .5,  0.30, ir1, 2
ao1 gbuzz 8000*ke*ka, icps, 25, 1, .9*kef, icosfn
asum = ao1
out asum
skip:
endin

instr 86
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 2,27
ao1 gbuzz 8000*ke*ka, icps, 7, 1, .9, icosfn
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvswarp fa, 1, ir1*10
asum pvsynth fb
out asum
skip:
endin

instr 87
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
klfo oscili 1, 144/45,-1,-1
ao1 gbuzz 8000*ke*ka, icps/2, 7, 1, .9, icosfn
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvswarp fa, 4, 0
asum pvsynth fb
out asum
skip:
endin

instr 88
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 128, 400
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvswarp fa, 1, ir1
asum pvsynth fb
out asum
skip:
endin

instr 89
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random -100, 256
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvswarp fa, 1, ir1
asum pvsynth fb
out asum
skip:
endin

instr 90
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random -100, 256
ir2 unirand 3
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvswarp fa, 1+abs(int(ir2)), 0;ir1
asum pvsynth fb
out asum
skip:
endin

instr 91
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random -100, 256
ir2 unirand 3
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvshift fa, ir1, 0
asum pvsynth fb
out asum
skip:
endin

instr 92
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 0, 256
ir2 unirand 3
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvshift fa, ir1, 0, 1
asum pvsynth fb
out asum
skip:
endin

instr 93
icosfn ftgenonce 0,0,8192,11,1
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 0, 256
ir2 unirand 2
ao1 vco2 8000*ke*ka, icps, 0, 0, 0
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvshift fa, ir1, 0, 1, 2
fc pvscale fb, 1+abs(ir2)
asum pvsynth fc
out asum
skip:
endin

instr 94
isinfn = -1
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,8192,isinfn,.25,0,4096,isinfn,.125,0,2048
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .100, -2, 0
ka transeg 0, .001, 0, 1
ir1 random 0, 256
ir2 unirand 2
ao1 fof 10000, icps, icps*7, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .060
fa pvsanal ao1, 1024, 256, 1024, 1
fb pvshift fa, ir1, 0, 1, 2
fc pvscale fb, 1+abs(ir2)
asum pvsynth fc
out asum
skip:
endin

instr 100
isinfn = -1
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,8192,isinfn,.25,0,4096,isinfn,.125,0,2048
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .180, -2, 0
ao1 fof 10000*ke, icps/2, icps, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1
out asum
skip:
endin

instr 101
isinfn = -1
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,8192,isinfn,.25,0,4096,isinfn,.125,0,2048
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/120
timout .200, p3-.2, skip
ke transeg 2, .150, -6, 0
ir1 random 5, 9
ao1 fof 10000*ke, icps, icps*int(ir1), 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1
out asum
skip:
endin

instr 102
isinfn = -1
ir random 2, 20
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,(16384/ir),isinfn,.25,0,(16384/(ir*ir)),isinfn,.125,0,(16384/(ir*ir*ir))
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .200, p3-.2, skip
ke transeg 1, .180, -3, 0
ao1 fof 10000*ke, icps/2, icps, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1
out asum
skip:
endin

instr 103
isinfn = -1
ir = 3
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,(16384/ir),isinfn,.25,0,(16384/(ir*ir)),isinfn,.125,0,(16384/(ir*ir*ir))
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .240, p3-.2, skip
ir1 random .080, .200
kpe linseg 4, ir1, 16
ke transeg 1, .230, 0, 0
ao1 fof 10000*ke, icps, icps*kpe, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1
out asum
skip:
endin

instr 104
isinfn = -1
ir = 3
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,(16384/ir),isinfn,.25,0,(16384/(ir*ir)),isinfn,.125,0,(16384/(ir*ir*ir))
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .240, p3-.2, skip
ir1 random 2, 4
kpe linseg 1, .060, ir1
ke transeg 1, .100, 0, 0
ao1 fof 10000*ke, icps, icps*kpe, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1
out asum
skip:
endin

instr 105
isinfn = -1
ir = 2
iplsrfn ftgenonce 0,0,16384*4,18,isinfn,1,0,16384,isinfn,.5,0,(16384/ir),isinfn,.25,0,(16384/(ir*ir)),isinfn,.125,0,(16384/(ir*ir*ir))
irisfn ftgenonce 0,0,512,-19,.5,.5,270,0
icps = 25*144/60
timout .240, p3-.2, skip
ke transeg 1, .120, 0, 0
ao1 fof 10000*ke, icps/2, icps, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
ao2 fof 10000*ke, icps/2, 18*icps, 0, 0, 0, .333/icps, 0, 100, iplsrfn, irisfn, .200
asum = ao1+delay(ao2,.0257)
out asum
skip:
endin

instr 106
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(1225,1550))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 107
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(1125,1450))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 108
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(1025,1350))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 109
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(925,1250))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 110
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(825,1150))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 111
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(725,1025))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 112
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(625,900))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 113
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(525,800))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 114
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(425,700))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 115
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(325,400))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 116
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(225,300))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 117
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(125,200))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 118
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(75,200))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 119
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(50,100))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 120
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =int(random(25,80))*144/60
icpsf = 25*144/60
;begin pitch mod
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
kn randomh 0.8, 4.9, icpsf/int(random(4,13)), 3
iscptch random 0, 1
iscptch table iscptch, iscfn, 1
;printk .05, kn
kcps table int(kn), iscfn
koct randomh 1, 3, icpsf, 3
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf*iscptch, kcps*icps*iscptch, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin



instr 122
seed 0
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =24*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 123
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =24*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 124
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =36*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 125
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =48*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 126
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =72*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 127
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =144*144/60
icpsf = 12*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 128
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =72*144/60
icpsf = 48*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 129
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =72*144/60
icpsf = 24*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 130
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =72*144/60
icpsf = 72*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 131
irisfn ftgenonce 0,0,512,-7,0,512,1
icps =72*144/60
icpsf = 48*144/60
;begin pitch mod
iscn = int(random(0,4.5)) ;for the formant freq
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin


instr 132 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 17*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 133 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 134 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 3 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 135 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 2 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 136 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 1 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 137 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 138 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 139 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 140 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 141 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 4 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 142 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 23*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 143 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 22*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 144 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 22*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 3 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 145 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 22*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 2 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 146 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 22*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 1 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 147 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-7,0,512,1
icps = 22*12*144/60
icpsf =2*12*144/60
;begin pitch mod
iscn = 0 ;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(1/1),(1.20),(1.33),(1.66),(1.75)
ifpn table iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 0, .25/icpsf, 1/icpsf, .25/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 148 ;try changing up icps and icpsf
;a large prime in icps, 1 -3 for icpsf
irisfn ftgenonce 0,0,512,-5,0.00001,512,1
icps = 7*394*144/60
icpsf =7*394*144/60
;begin pitch mod
iscn random 0, 4;for the formant freq chording
iscfn ftgenonce 0,0,5,-2,(3/2),(27/16),(24/14),(18/10),(2)
ifpn tablei iscn, iscfn
icps *= ifpn
;printk .05, kn
;end pitchmod
timout .450, p3-.2, skip
ke transeg 1, 1.5*60/144, 0, 0
ao1 fof 5000*ke, icpsf, icps, 0, 1200, .125/icpsf, .5/icpsf, .0625/icpsf, 100, -1, irisfn, 120/144
;ao1 butbr ao1, icpsf, icpsf/4
;ao1 butbr ao1, icpsf, icpdf/4
asum = ao1
out asum
skip:
endin

instr 149
p3 = .083
avco2 gausstrig 1000,60,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0024,1,.132,1/19
avco2 moogvcf avco2, 60*64*kefc,.005,0dbfs
out avco2*10
endin

instr 150
p3 = .083
avco2 gausstrig 1000,60,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0024,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.005,0dbfs
out avco2*10
endin

instr 151
p3 = .083
avco2 gausstrig 1000,60,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0084,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.005,0dbfs
out avco2*10
endin

instr 152
p3 = .083
avco2 gausstrig 1000,60,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0084,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.065,0dbfs
out avco2*10
endin

instr 153
p3 = .083
avco2 gausstrig 1000,60,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0014,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.015,0dbfs
out avco2*10
endin

instr 154
p3 = .084
icps = 60
avco2 gausstrig 1000,icps,random(0,.15)
avco2 tone avco2, 60*64
kefc expseg 1/10,.0014,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.0005,0dbfs
avco2wet mode avco2, icps*13, 100
avco2 alpass avco2, .001, .001
avco2weta mode avco2, icps*19, 100
avco2 delay avco2, .011
avco2wet delay avco2wet, .0135
avco2weta delay avco2weta, .087
out (avco2*40)+(avco2wet*02)+(avco2wet*10)
endin

instr 155
isdchnfn ftgenonce 0,0,4,-2,0,random(.02,.5),1,1
ksdchn oscil 1, 144/60, isdchnfn, -1
ksdchn = 0.05+(ksdchn*random(1,1.125))
ksdchn port ksdchn, .01
;printk .01, ksdchn
p3 = .25*60/144
icps = 60
avco2 gausstrig 100,icps,random(0,.15)
avco2a vco2 700, icps*1.2, 0, 0, 0, .35
avco2 tone avco2, 60*64
kefc expseg 1/10,.0014,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.0005,0dbfs
avco2wet mode avco2, icps*7, 100
avco2a moogvcf avco2a, 60*64*kefc,.0005,0dbfs
avco2a mode avco2a, icps*13, 100
avco2 alpass avco2, .001, .001
avco2weta mode avco2, icps*13, 100
avco2 delay avco2a*ksdchn+avco2*ksdchn, .011
avco2wet delay avco2wet*ksdchn, .0135
avco2weta delay avco2weta*ksdchn, .087
out (avco2*.15)+(avco2wet*.01)+(avco2wet*.2)
endin

instr 156
p3 = .084
icps = 60
avco2 gausstrig 100,icps,random(0,.15)
avco2a vco2 700, icps*1.2, 0, 0, 0, .35
avco2 tone avco2, 60*64
kefc expseg 1/10,.0014,1,.232,1/19
avco2 moogvcf avco2, 60*64*kefc,.0005,0dbfs
avco2wet mode avco2, icps*13, 100
avco2a moogvcf avco2a, 60*64*kefc,.0005,0dbfs
avco2a mode avco2a, icps*23, 100
avco2 alpass avco2, .001, .001
avco2weta mode avco2, icps*13, 100
avco2 delay avco2a+avco2, .011
avco2wet delay avco2wet, .0135
avco2weta delay avco2weta, .087
out (avco2*.05)+(avco2wet*.01)+(avco2wet*.2)
endin

instr 157
icosfn ftgenonce 0,0,16384,11,1
isdchnfn ftgenonce 0,0,4,-2,0,1,1,1
ksdchn oscil 1, 144/60, isdchnfn, -1
ksdchn = 0.0+(ksdchn*random(1,1.125))
;ksdchn port ksdchn, .01
printk .01, ksdchn
p3 = .25*60/144
icps = 72
avco2 gbuzz (.5+.5*ksdchn)*700,icps,7,7,2,icosfn
avco2a vco2 ksdchn*500, icps*1.2, 0, 0, 0, .35
avco2sum butlp avco2a+(avco2), 60*64
kefc expseg 1/100,.0074,1,.202,1/19
avco2wet moogvcf avco2sum, 60*16*kefc,.5,0dbfs
out (avco2wet)
endin

instr 158
icosfn ftgenonce 0,0,16384,11,1
isdchnfn ftgenonce 0,0,4,-2,0,1,1,1
ksdchn oscil 1, 144/60, isdchnfn, -1
ksdchn = 0.0+(ksdchn*random(1,1.125))
;ksdchn port ksdchn, .01
printk .01, ksdchn
p3 = .25*60/144
icps = 72
avco2 gbuzz (.5+.5*ksdchn)*700,icps,7,7,2,icosfn
avco2a vco2 ksdchn*500, icps*1.2, 0, 0, 0, .35
avco2sum butlp avco2a+(avco2), 60*64
kefc expseg 1/100,.0074,1,.202,1/19
avco2wet moogvcf avco2sum, 60*16*kefc,.5,0dbfs
ke expseg 1, .008, 1, .01, 3, .008, 1
out (avco2wet)
endin

instr 159
seed 0
icps = 25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .005, .01,  .005, 100, -1, irisfn, p3
out afof
endin

instr 160
seed 0
icps = 25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, -1, irisfn, p3
out afof
endin

instr 161
seed 0
icps = 25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 20, .001, .01,  .005, 100, -1, irisfn, p3
out afof
endin

instr 162
seed 0
icps = 25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 30, .005, .01,  .005, 100, -1, irisfn, p3
out afof/8
endin

instr 163
seed 0
icps = 4*25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .005, .01,  .005, 100, -1, irisfn, p3
out afof/8
endin

instr 164
seed 0
icps = 25*144/60
ifrmt random 300,1800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .0039, .01,  .005, 100, -1, irisfn, p3
out afof/8
endin

instr 165
seed 0
icps = 6*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .005, .01,  .005, 100, -1, irisfn, p3
afof comb afof, p3, 45/144
out afof/8
endin

instr 166
seed 0
icps = 6*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, -1, irisfn, p3
afof comb afof, p3, 45/144
out afof/8
endin

instr 167
seed 0
icps = 8*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .005, .01,  .005, 100, -1, irisfn, p3
afof comb afof, p3, 45/144
out afof/8
endin

instr 168
seed 0
icps = 8*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, -1, irisfn, p3
afof comb afof, p3, 45/144
out afof/8
endin

instr 169
seed 0
icps = 8*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 10000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof comb afof, p3, 45/144
out afof/8
endin

instr 170
seed 0
icps = 8*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof/8
endin

instr 171
seed 0
icps = 6*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof/8
endin

instr 172
seed 0
icps = 4*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof/8
endin

instr 173
seed 0
icps = 2*25*144/60
ifrmt random icps,4800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof/8
endin

instr 174
seed 0
icps = 2*25*144/60
ifrmt random icps,800
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,.60
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof/8
endin

instr 175
seed 0
icps = 2*25*144/60
ifrmt random icps,800
imul random .5, 1.34
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
;afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof
endin

instr 176
seed 0
icps = 1*25*144/60
ifrmt random icps,800
imul random .5, 1.34
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
;afof comb afof, p3, 45/144
out afof
endin

instr 177
seed 0
icps = 2*25*144/60
ifrmt random icps,4800
imul random .5, 1.34
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
afof comb afof, p3, 45/144
out afof
endin

instr 178
seed 0
icps = 1*25*144/60
ifrmt random icps,4800
imul random .5, 1.34
idur random .150, .190
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,15,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
afof fof 5000*ke, icps, ifrmt, 0, 0, .001, .01,  .005, 100, isinfn, irisfn, p3
;afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof comb afof, p3, 45/144
out afof
endin

instr 179
p3 = int(random(10,14))/144
seed 0
icps = 4*25*144/60
ifrmt random 2*icps*5.5,2*icps*7.5
imul random .0625, .75
idur random .150, .67
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,27,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
kfofatk = .1625/ifrmt
kfm randomh .991, 1.009, 144/5
afof fof 900, icps*kfm, ifrmt, 0, 0, kfofatk, .005,  .005, 100, isinfn, irisfn, 1, 0, -1
;afof compress afof, afof, 0, 24,96,1/21,.00050,.0050,.010
;afof clip afof, 2, 900
;afof clip afof, 2, 100
;afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof *= jitter(.1,3,6)+.5+oscil(.5,2*icps/int(random(1,4)),-1,-1)
out afof*8
endin

instr 180
p3 = int(random(10,14))/144
seed 0
itonicf = 4*25*144/60
icps random 0, 1;random index to scale
iscale ftgenonce 0,0,4,-2,.75,6/8,8/9,1;,9/8,11/9,4/3,1.5
icps table icps, iscale, 1
icps *= itonicf
ifrmt random 2*icps*5.5,2*icps*7.5
imul random .0625, .75
idur random .150, .67
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,27,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
kfofatk = .1625/ifrmt
kfm randomh .991, 1.009, 144/5
afof fof 900, icps, ifrmt, 0, 0, kfofatk, .005,  .005, 100, isinfn, irisfn, 1, 0, -1
;afof compress afof, afof, 0, 24,96,1/21,.00050,.0050,.010
;afof clip afof, 2, 900
;afof clip afof, 2, 100
;afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof *= jitter(.1,3,6)+.5+oscil(.5,2*icps/int(random(1,4)),-1,-1)
out afof*8
endin

instr 181
p3 = int(random(10,14))/144
seed 0
itonicf = 4*25*144/60
icps random 0, 1;random index to scale
iscale ftgenonce 0,0,4,-2,1,9/8,6/5,3/2
icps table icps, iscale, 1
icps *= itonicf
ifrmt random 2*icps*5.5,2*icps*7.5
imul random .0625, .75
idur random .150, .67
ke expseg, .0001,.003,1,idur,.0001
isinfn ftgenonce 0,0,16384,11,27,1,imul
irisfn ftgenonce 0,0,16384,-5,.0001,16384,1
kfofatk = .1625/ifrmt
kfm randomh .991, 1.009, 144/5
afof fof 900, icps, ifrmt, 0, 0, kfofatk, .005,  .005, 100, isinfn, irisfn, 1, 0, -1
;afof compress afof, afof, 0, 24,96,1/21,.00050,.0050,.010
;afof clip afof, 2, 900
;afof clip afof, 2, 100
;afof *= .5+(oscili(.75,2*144/60,-1,-1))^2
afof *= jitter(.1,3,6)+.5+oscil(.5,2*icps/int(random(1,4)),-1,-1)
out afof*8
endin

instr 182
icps = 15
kf1 = int(.5*(1+(2*abs(gkaccela))))*icps
;printk 10000, kf1, 10
kf2 = int(.5*(1+(5*abs(gkaccelb))))*icps
;printk 10000, kf2, 11
kf3 = int(.5*(1+(8*abs(gkaccelc))))*icps
;printk 10000, kf3, 13
idur = .200
igtlng = .100
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
avco1 vco2 keat*kedc*1, kf1, 0, 0, 0, .125
avco2 poscil3 keat*kedc*1, kf2
avco3 poscil3 keat*kedc*1, kf3
asum = (avco2)*(avco2)*(avco3)
asum *= 20000
;asum moogvcf  asum,icps*16,.00,0dbfs,0 
out asum
endin

instr 183
icps = 120
kf1 = (.5*(1+(3*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(1+(3*abs(gkaccelb))))*icps
kf2 port kf2, .005
;printk 10000, kf2, 11
kf3 = (.5*(1+(3*abs(gkaccelc))))*icps
kf3 port kf3, .005
;printk 10000, kf3, 13
idur random .060, .210
igtlng = .100
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
irisfn ftgenonce 0,0,16384,-5,1/10000,16383,1
avco1 fof keat*kedc*1, icps, kf1, 0, 0, 0.002, 1/icps, .005,100,-1,irisfn, p3 
avco2 fof keat*kedc*1, icps, kf2, 0, 10, 0.002, 1/icps, .005,100,-1,irisfn, p3 
avco3 fof keat*kedc*1, icps, kf3, 0, 20, 0.002, 1/icps, .005,100,-1,irisfn, p3 
asum = (avco1)+(avco2)+(avco3)
asum *= 10000
;asum moogvcf  asum,icps*16,.00,0dbfs,0 
out asum
endin

instr 184
icps = 60
kf1 = (.5*(3+(6*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(1+(6*abs(gkaccelb))))*icps
kf2 port kf2, .005
;printk 10000, kf2, 11
kf3 = (.5*(1+(8*abs(gkaccelc))))*icps
kf3 port kf3, .005
;printk 10000, kf3, 13
idur random .060, .210
igtlng = .100
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
irisfn ftgenonce 0,0,16384,-5,1/10000,16383,1
avco1 poscil3 keat*kedc*1, kf1
avco2 poscil3 keat*kedc*1, kf2
avco3 poscil3 keat*kedc*1, kf3
asum = (avco1)+(avco2)+(avco3)
asum *= 10000
;asum moogvcf  asum,icps*16,.00,0dbfs,0 
out asum
endin

instr 185
icps = 75
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
;printk 10000, kf2, 10
kf3 = (.1*(10+(.01*gkaccelc)))*icps
kf3 port kf3, .005
;printk 10000, kf3, 10
icosfn ftgenonce 0,0,16384,11,1
irnd1 = random(0, 1.1)
igtlng random .100, .180
idur = .180
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
avco1 gbuzz keat*kedc*1, icps, 38, 2, .7920128, icosfn;bandlim saw
avco2 vco2 keat*kedc*1, icps, 2, .5, .5
avco3 poscil3 keat*kedc*.7, kf3/2
kfe0 transeg 1, idur, 1, 1.5
avco1 butbp avco1, kf1*kfe0, kf1/3
avco2 butbp avco2, kf2*kfe0, kf2/3
asum = (avco1)+(avco2);+(avco3); sub optional
asum *= 10000
;asum compress asum, asum, 0, 24, 36, 6, .001, .005, .001
out asum
endin

instr 186
itonicf =75
icps random 0, 1;random index to scale
iscale ftgenonce 0,0,4,-2,1,6/5,4/3,1.5
icps table icps, iscale, 1
icps *= itonicf
icosfn ftgenonce 0,0,16384,11,1
irnd1 = random(0, 1.1)
igtlng random .0500, .180
idur = .180
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
irnd1 random 2, 26
avco1 gbuzz keat*kedc*1, icps, 30-irnd1, +irnd1, 1.100920128, icosfn;bandlim saw
asum = (avco1)
asum *= 10000
;asum compress asum, asum, 0, 24, 36, 6, .001, .005, .001
out asum
endin

instr 187
icps = 75
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
;printk 10000, kf2, 10
kf3 = (.1*(10+(.01*gkaccelc)))*icps
kf3 port kf3, .005
;printk 10000, kf3, 10
irnd1 = random(0, 1.1)
igtlng random .100, .180
idur = .220
keat transeg 0,idur,-100, 1
kedc expseg 1,idur,1/10000
avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 1, idur, 1, 1.5
ahp,alp,avco1,abr statevar avco1, kf1*kfe0, 2
asum = avco1
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 188
icps = 75
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .150
idur = .200
icosfn ftgenonce 0,0,16384,11,1
keat transeg 0,idur,-120, 1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,3.9), idur, random(-18,-4), .5
avco1 gbuzz keat*kedc*1, icps, 5, 1, kmul, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 1, idur, 2, 1/10000
;ahp,avco1,abp,abr statevar avco1, kf1*kfe0, 2
asum = avco1
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 189
icps = 75
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .150
idur = .200
icosfn ftgenonce 0,0,16384,11,1
keat transeg 0,idur,-120, 1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,3.9), idur, random(-18,-4), .5
avco1 gbuzz keat*kedc*1, icps, 5, 1, kmul, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg .5*int(random(2,5)), idur, 8, 1/18
ahp,avco1,abp,abr statevar avco1, kf1*kfe0, 4
asum = avco1
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 190 ;189 "bent"
icps = 75*int(random(4,8))
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .150
idur = .200
icosfn ftgenonce 0,0,16384,11,1
keat transeg 0,idur,-120, 1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,13.9), idur, random(-18,-4), .5
avco1 gbuzz keat*kedc*1, icps, 7, 1, kmul, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 1, idur, 4, 1/18
ahp,alp,abp,abr statevar avco1, kf1*kfe0, 1
asum = abp-alp
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 191
icps = 75
seed 0
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .080
idur = random(.180,.230)
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,3.9), idur, random(-18,-4), .5
avco1 gbuzz keat*kedc*1, icps, 5, 1, .99, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 1, idur, -13, 1/8
avco1 bqrez avco1, icps*21*kfe0, 20, 0
avco1 buthp avco1, icps*11
;avco1 bqrez avco1, icps*37*kfe0, 00, 0
asum = avco1
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 193
idur = random(.380,.930)
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc expseg 1,idur,1/100
kcps linseg 1, p3/2, 19, p3/2, 1
kcps *= 150
keml oscili 1.5, .67
avco1 gbuzz 1, kcps, 4, 3, keml, icosfn
out avco1*keat*kedc*10000
endin

instr 192
idur = .300
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
kcps linseg 1, idur*.20, 4, idur*.50,1,idur*.2,3,idur*.3,1
kcps += transeg:k(1,idur,1,3.5)
kcps *= 30
keml expseg 2, idur, 1/3
avco1 gbuzz 1, kcps, 1, 12, .5, icosfn
asum = avco1*keat*kedc
asum butlp asum, 4000
out asum*10000
endin

instr 194
idur = .220
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 30
;keml expseg 1, idur*.20,2,idur*.20,1,idur*.20,5,idur*.20,1,idur*.20,9
keml linseg 1, idur/4, 9, idur/4,1,idur/2,12
kcps expseg icps, idur*random(1,2), icps*9
avco1 gbuzz 1, kcps, 3, 13, keml/6, icosfn
asum = avco1*keat*kedc
aap alpass diff(asum), 90/144, 30/144
asum butlp asum+aap, 4000
xtratim 2
out asum*10000
endin

instr 195
idur = .440
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 180
;keml expseg 1, idur*.20,2,idur*.20,1,idur*.20,5,idur*.20,1,idur*.20,9
keml linseg 1, idur/4, 9, idur/4,1,idur/2,12
avco1 gbuzz 1, icps, 5, 4, keml/6, icosfn
asum = avco1*keat*kedc
asum butlp asum, 4000
out asum*10000
endin

instr 196
idur = .300
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 60
;keml expseg 1, idur*.20,2,idur*.20,1,idur*.20,5,idur*.20,1,idur*.20,9
keml expseg 19, idur, 1
avco1 gbuzz 1, icps, 7, 2, keml/16, icosfn
asum = avco1*keat*kedc
asum butlp asum, 4000
out asum*10000
endin

instr 197
idur = .500
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 55
ikfn1 ftgenonce 0,0,16384,-16,1,16384,random(-8,-1),-1
kcps tablei phasor:k(.5/idur), ikfn1, 1
kcps = 2 + (1.99*kcps)
irisfn ftgenonce 0,0,16384,-5,1/100000,16384,1
avco1 fof 1, (kcps)*icps, icps*2, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco2 fof 1, (kcps)*icps, icps*4, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco3 fof 1, (kcps)*icps, icps*6, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
asum = (avco1+avco2+avco3)*keat*kedc
asum buthp asum, 2000
out asum*7000
endin

instr 198
idur = random(.250,.350)
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 150
ikfn1 ftgenonce 0,0,16384,-7,-1,16384,1
kcps tablei phasor:k(.5/idur), ikfn1, 1
kcps = 2 + (1.99*kcps)
irisfn ftgenonce 0,0,16384,-5,1/100000,16384,1
avco1 fof 1, (kcps)*icps, (3-(kcps/2))*icps*2, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco2 fof 1, (kcps)*icps, (3-(kcps/2))*icps*3, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco3 fof 1, (kcps)*icps, (3-(kcps/2))*icps*5, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
asum = (avco1+avco2+avco3)*keat*kedc
adel alpass asum, 180/144, 45/144
asum += adel
asum atone asum, 2000
asum atone asum, 3000
out asum*7000
endin

instr 199
idur = .350
icosfn ftgenonce 0,0,16384,11,3,random(0,.925)
keat transeg 0,idur,-120, 1
kedc transeg 1,idur,12,1/100
icps = 55
ikfn1 ftgenonce 0,0,16384,-7,-1,16384,1
kcps tablei phasor:k(.5/idur), ikfn1, 1
kcps = 2 + (1.99*kcps)
irisfn ftgenonce 0,0,16384,-5,1/100000,16384,1
avco1 fof 1, (kcps)*icps, icps*2, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco2 fof 1, (kcps)*icps, icps*4, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
avco3 fof 1, (kcps)*icps, icps*6, 0, 0, .0621/icps, .89/icps, .125/icps, 1000, -1, irisfn, p3
asum = (avco1+avco2+avco3)*keat*kedc
asum buthp asum, 2000
out asum*7000
endin

instr 200
icps = 75
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .103
idur = .148
icosfn ftgenonce 0,0,16384,11,1
keat transeg 0,.001,0, 1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,3.9), idur, random(-18,-9), .15
avco1 gbuzz keat*kedc*1, icps, 9, 1, kmul, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 3, idur, 8, 1/18
ahp,avco1,abp,abr statevar avco1, kf1*kfe0, 4
asum = avco1
;asum pareq asum, icps*3, .80, sqrt(.5)
;asum pareq asum, icps*5, .80, sqrt(.5)
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
endin

instr 201
timout .300, p3-.300, skip
icps = 120
kf1 = (.5*(9+(9*abs(gkaccela))))*icps
kf1 port kf1, .005
;printk 10000, kf1, 10
kf2 = (.5*(6+(7*abs(gkaccelb))))*icps
kf2 port kf2, .005
printk 10000, kf2/20, 10
igtlng = .103
idur = .148
icosfn ftgenonce 0,0,16384,11,1
keat transeg 0,.001,0,1
kedc expseg 1,idur,1/100
kmul transeg random(1.9,3.9), idur, random(-18,-9), .15
avco1 gbuzz keat*kedc*1, icps, 5, 1, kmul, icosfn
;avco1 vco2 keat*kedc*1, icps, 0
kfe0 transeg 3, idur, 5, 1/18
ahp,avco1,abp,abr statevar avco1, kf1*kfe0, 4
asum = avco1
;asum pareq asum, icps*3, .80, sqrt(.5)
;asum pareq asum, icps*5, .80, sqrt(.5)
asum *= 10000
asum clip asum, 2, 0dbfs
out asum
skip:
endin

;basses that go to ga0
instr 745
icps = 25*144/60
aplck pluck 10000, icps, icps*64, 0, 1
ga0=aplck ;send back
endin

;-------------KICKS BEGIN---------------;

instr 1000
andx linseg 0, p3, p3*sr ;count samples
akick tablei andx, p4, 0
out akick*20000
endin

instr 1001
andx linseg 0, p3, p3*sr ;count samples
akick tablei andx, 1, 0
akick chebyshevpoly akick, 0, 0, 0, -1
out akick*20000/2
endin

instr 1002
andx linseg 0, p3, p3*sr*29/33 ;count samples
akick tablei andx, 1, 0
;akick chebyshevpoly akick, 1,-.125,-.33,.25,.2
out akick*20000/5
endin

instr 1003
andx linseg 0, p3, p3*sr ;count samples
akick tablei andx, p4, 0
akick delay akick, .030
out akick*20000
endin

instr 1004
ke1 transeg 1,.120,0,1,.160,3,0
kpe1 transeg 3000, .028, -3, 49, .105, 0, 49
ke2 transeg 1,.03500,2,0
kpe2 transeg 15500, .090, 0, 647
ke3 linseg 1, .005, 1, 0, 0, p3, 0
isawfn ftgenonce 0,0,16384,11,4,1,-.5
aswp1 poscil3 18000*ke1,kpe1,-1
aswp2 poscil3 6000*ke2, kpe2,isawfn
aclk mpulse 9000*ke3, 100000
aclkr reverb aclk, 60/144
asum = aclk+aswp1
;asum butlp asum, 3000
;asum butbr asum, 800, 400
out asum
endin

instr 1005
idur = p3
icps= 60
ke2 expseg 1/1000, .004, 1, idur, 1/1000
aclk mpulse 59000, 100000
aclk tone aclk, 4000
aclk tone aclk, 4000
asub poscil3 16000*ke2, icps, -1, .70
asum = aclk+ asub
;asum butlp asum, 3000
;asum butbr asum, 800, 400
out asum
endin

instr 1006
seed 0
icps =60
timout 0, .003, skip
ke3 linseg 1, .005, 1, 0, 0, p3, 0
kpe2 transeg 2500, .010, 0, 0
aswp poscil3 8000, kpe2, -1
aswp dcblock aswp
aclk mpulse 19000*ke3, 100000
aclk mode aclk, icps, icps/10
asum = aswp+aclk
out asum
skip:
endin

;inatr 1007


;kicks that go to ga1
instr 1745
andx linseg 0, p3, p3*sr ;count samples
akick tablei andx, p4, 0
ga1 = akick*20000
endin


</CsInstruments>
<CsScore>
;kick samples
f1 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.001" 0 0 1  ;soundfile
f2 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.002" 0 0 1  ;soundfile
f3 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.003" 0 0 1  ;soundfile
f4 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.004" 0 0 1  ;soundfile
f5 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.005" 0 0 1  ;soundfile
f6 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.006" 0 0 1  ;soundfile
f7 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.007" 0 0 1  ;soundfile
f8 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.008" 0 0 1  ;soundfile
f9 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.009" 0 0 1  ;soundfile
f10 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.010" 0 0 1  ;soundfile
f11 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.011" 0 0 1  ;soundfile
f12 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.012" 0 0 1  ;soundfile
f13 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.013" 0 0 1  ;soundfile
f14 0 [2^19] 1 "/storage/emulated/0/Csound/Samples/soundin.014" 0 0 1  ;soundfile
f15 0 4 2 0 0 0 0
;end kick samples

f 101 0 4 -2 0 0 1 1 ;bass pattern
f 102 0 4 -2 1 0 0 0 ;kick pattern

f300 0 16384 19 1 -1 0 0
f303 0 16384 -16 0 12  0 -1 8180 0 0 8180 -.23 .683 12 0 0
  
t 0 144

#define B #i17#

a 0 0 204

{7 x
i1 [$x*8] 8 [17+$x] .1 1000 .15 1 8
}

{4 x
i1 [56+[$x*8]] 8 [24+$x] .2 1000 .15 1
}

{8 x
i1 [88+[$x*8]] 8 [28+$x] .2 1000 .15 1
}

{4 x
i1 [152+[$x*8]] 8 [36+$x] .2 1000 .15 1
}

b 204
f 101 0 4 -2 0 0 1 1  ;bass pattern
f 102 0 4 -2 1 0 0 0  ;kick pattern


{64 x
i1100 [0+[$x*8]] 8
i1 [0.01+[$x*8]] 8 [202] 2.200 [1005] .200 [2] 8 ;seq up
;i1 [0+[$x*8]] 8 [106] 2.200 [1000] .250 [15] 8 only play 1 bass
;i1 [0+[$x*8]] 8 [102] 2.200 [106] .250 [15] 8 ;for playing 2 bass no kick
;i1 [0+[$x*8]] 8 [93] 2.205 [1003] .250 [2] 8 ;delayed kick
;i2 [0+[$x*8]] 8 [24] .08 [1000] .032 [$x+1] 8
}

e
b 300
f 101 0 4 -2 1 0 0 0;bass pattern
f 102 0 4 -2 1 0 0 0  ;kick pattern

{12 x
i1 [0+[$x*8]] 8 [71] 0.200 [1005] .250 [2] 8
;i1 [0+[$x*8]] 8 [71] 2.205 [1000] .250 [2] 8
;i2 [0+[$x*8]] 8 [24] .08 [1000] .032 [$x+1] 8
}


</CsScore>
</CsoundSynthesizer>
