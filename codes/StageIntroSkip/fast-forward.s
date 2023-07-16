/**
 * @TMarDirector::direct()
 * Fast foward until tgcConsole2's state == 2
 */
# r26 = gpMarDirector

.onLastQF:
## return unless gpMarDirector->gameState == 1
  lbz r12, 0x64(r26)
  cmpwi r12, 1
  bne+ .L.orig
.L.gameState1:
## check gpMarDirector->tgcConsole2->consoleStr->state?
### r12 = tgcConsole2
  lwz r12, 0x74(r26)
### r12 = consoleStr
  lwz r12, 0x94(r12)
### r12 = state?
  lwz r11, .offState(r12)
  cmpwi r11, 3
## return if state > 3
  bgt+ .L.orig
## skip if state < 3
  blt+ .L.skip
## set gpApplication.TSMSFader.color = 0 if state == 3??
  lis r12, gpApplication+0x34@ha
  lwz r12, gpApplication+0x34@l(r12)
  li r11, 0
  stw r11, 0x18(r12)
  b .L.orig
.L.skip:
## skip setting last QF flag and proceed next 4 QF
### qfSync = 20-5
  addi r3, r3, 15
  stw r3, 0x54(r26)
## r28 = iQF = 0
  li r28, 0
  b .L.end
.L.orig:
  sth r0, 0x4C(r26)
.L.end:
