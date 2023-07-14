from supSMSGecko import make_xml, symbols

def main(g, ver):
  S = symbols[ver]
  g.C2(48+S['TMarDirector::updateGameMode'], 'code.s')

make_xml(main)
