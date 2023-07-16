/**
 * @TMarDirector::changeState()
 * Simulate A/B press to end the intro cutscene ASAP
 */

.startCloseWipe:
## skip only if gpMarDirector->tgcConsole2->consoleStr->state? == 0
  lwz r3, 0x74(r31)
  lwz r3, 0x94(r3)
  lwz r3, .offState(r3)
  cmpwi cr1, r3, 0
## orig
  andi. r0, r0, 0x61
## clear eq bit to proceed to run TConsoleStr::startCloseWipe() when cr1.eq is set
### cr0.eq = cr0.eq and ~cr1.eq
  crandc eq, eq, 4*cr1+eq
.L.end:
