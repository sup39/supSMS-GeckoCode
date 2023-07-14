/** Kill the Yoshi egg and spawn Yoshi immediately. */

.set rInput, 3

.TEggYoshi.control.killEgg:
## check input
  lis rInput, mPadStatus@ha
  lhz rInput, mPadStatus@l(rInput)
### Y
  rlwinm r0, rInput, 0, 0xFFF0
  cmpwi r0, 0x0800
  bne .killEgg.done
### D-Pad
  rlwinm. rInput, rInput, 1, 30-3, 30
  beq .killEgg.done
## set pointer
  lwz r3, gpMarioOriginal$r13(r13)
  lwz r3, 0x3f0(r3)
  stw r31, 0xf0(r3)
## egg.makeObjDead()
  mr r3, r31
  lwz r12, 0(r3) # egg.vtable
  lwz r12, 0x104(r12) # &makeObjDead()
  mtlr r12
  blrl

.killEgg.done:
  lhz r0, 0xfc(r31)
