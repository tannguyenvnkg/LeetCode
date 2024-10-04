int romanToInt(String s) {
  final Map<String, int> symbols = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
    // customize
    'IV': 4,
    'IX': 9,
    'XL': 40,
    'XC': 90,
    'CD': 400,
    'CM': 900,
  };
  final reg = RegExp(r'[IXC]');
  final keys = symbols.keys.toList();
  final List<int> skipElementList = [];
  int value = 0;
  for (int i = 0; i < s.length; i++) {
    if (skipElementList.contains(i)) continue;

    if ((reg.hasMatch(s[i]) && i + 1 < s.length) &&
        ((s[i] == 'I' && (s[i + 1] == 'V' || s[i + 1] == 'X')) ||
            s[i] == 'X' && (s[i + 1] == 'L' || s[i + 1] == 'C') ||
            s[i] == 'C' && (s[i + 1] == 'D' || s[i + 1] == 'M'))) {
      final valueInSymbols = symbols['${s[i]}${s[i + 1]}']!;
      value += valueInSymbols;
      skipElementList.add(i + 1);
    } else {
      value += symbols[s[i]]!;
    }
  }
  return value;
}
