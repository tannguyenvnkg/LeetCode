import 'package:test/test.dart';
import 'package:leetcode_repo/roman_to_integer/roman_to_integer.dart';

main() {
  test('romanToInt with value MCMXCIV', () {
    expect(romanToInt('MCMXCIV'), 1994);
  });
  test('romanToInt with value III', () {
    expect(romanToInt('III'), 3);
  });
  test('romanToInt with value IV', () {
    expect(romanToInt('IV'), 4);
  });
  test('romanToInt with value IX', () {
    expect(romanToInt('IX'), 9);
  });

  test('romanToInt with value LVIII', () {
    expect(romanToInt('LVIII'), 58);
  });
}