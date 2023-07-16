from supSMSGecko import make_xml, symbols, Button as B

def main(g, ver):
  S = symbols[ver]
  a_fast_forward = 0x158 + S['TMarDirector_direct']
  a_auto_press = 0x1cc + S['TMarDirector_changeState']
  asm = '.set .offState, %d'%{
    'GMSJ01': 0x2BC,
    'GMSJ0A': 0x2BC,
    'GMSE01': 0x2B8,
    'GMSP01': 0x8DC,
  }[ver]
  ## enable
  g.if16(S['mPadStatus'], '==', B.R | B.DU)
  g.C2(a_fast_forward, 'fast-forward.s', extra_as_input=asm)
  g.C2(a_auto_press, 'auto-press.s', extra_as_input=asm)
  ## disable (restore original instructions)
  g.if16(S['mPadStatus'], '==', B.R | B.DD, endif=True)
  g.write32(a_fast_forward, 0xB01A004C) # sth r0, 0x4C(r26)
  g.write32(a_auto_press, 0x70000061) # andi. r0, r0, 0x61
  g.endif()

make_xml(main)
