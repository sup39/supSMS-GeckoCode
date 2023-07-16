.GXBegin:
  li r4, 0
  lis r12, GXBegin@ha
  la r12, GXBegin@l(r12)

.call:
  mtctr r12
  bctr

.draw.epilogue:
  mtlr rLR
  blr
