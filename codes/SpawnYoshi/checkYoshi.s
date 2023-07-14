/** Trick the game as if Mario meets the condition to ride on Yoshi. */

.set rYoshi, 3
.set rInput, 4
.set $RideYoshi, 0x1C0 + TMario_checkCollision

.TMario.checkCollision.checkYoshi:
  lwz rYoshi, 0x3f0(r31)

## check input
  lis rInput, mPadStatus@ha
  lhz rInput, mPadStatus@l(rInput)
### Y
  rlwinm r0, rInput, 0, 0xFFF0
  cmpwi r0, 0x0800
  bne .checkYoshi.inactived
### D-Pad
  rlwinm. rInput, rInput, 1, 30-3, 30
  beq .checkYoshi.inactived

## color
  lis r0, 0x6300
  rlwnm r0, r0, rInput, 0x3
  stb r0, 0xD0(rYoshi)
## juice
  lwz r0, 8(rYoshi)
  stw r0, 0xC(rYoshi)

## goto ride Yoshi
.checkYoshi.done:
  lwz r3, 0x3f0(r31)
  lis r12, $RideYoshi@h
  ori r12, r12, $RideYoshi@l
  mtlr r12
  blr

.checkYoshi.inactived:
