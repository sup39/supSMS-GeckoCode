from supSMSGecko import make_xml, symbols

def main(g, ver):
  S = symbols[ver]
  g.C2(0x44 + S['TMario::checkCollision'], 'checkYoshi.s')
  g.C2(0x1c + S['TEggYoshi::control'], 'killEgg.s')

make_xml(main)
