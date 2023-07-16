.set aArea,  14 + gpApplication
.set aBL,    1160 + TMarDirector_updateGameMode
.set $button, 0x208

.L_C2:
# check input
  lis       r3, mPadStatus@ha
  lhz       r5, mPadStatus@l(r3)
  cmplwi    r5, $button
  bne+      .L_done
# reset QFT
  lis       r3, 0x817F
  li        r5, 0x1
  stb       r5, 0xB3(r3)
  stb       r5, 0x100(r3)
# set next area
  lis       r3, aArea@ha
  lwzu      r5, aArea@l(r3)
  stw       r5, 4(r3)
# set curArea to 0x40 to force reset coin counter
  li        r5, 0x40
  stw       r5, 0(r3)
# b moveStage
  lis       r3, aBL@h
  ori       r3, r3, aBL@l
  mtlr      r3
  blr

# original instruction
.L_done:
  cmpwi     r0, 0x2
