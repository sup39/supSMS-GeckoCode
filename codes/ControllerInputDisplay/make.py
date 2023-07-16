from supSMSGecko import make_xml, symbols

def main(g, ver):
  S = symbols[ver]
  g.C2(0x378 + S['TApplication_gameLoop'], 'main.s', extra_as_input=[
    '.set $conf, 0x817f04c3',
  ]);

make_xml(main)
