import 'package:test/test.dart';
import 'package:leetcode_repo/longest_common_prefix//longest_common_prefix.dart';

main() {
  test('longestCommonPrefix with value ["flower","flow","flight"]', () {
    expect(longestCommonPrefix(["flower","flow","flight"]), 'fl');
  });
  test('longestCommonPrefix with value ["dog","racecar","car"]', () {
    expect(longestCommonPrefix(["dog","racecar","car"]), '');
  });
  test('longestCommonPrefix with value ["dog","dog","dog"]', () {
    expect(longestCommonPrefix(["dog","dog","dog"]), 'dog');
  });
  test('longestCommonPrefix with value ["abab","aba",""]', () {
    expect(longestCommonPrefix(["abab","aba",""]), '');
  });

  test('longestCommonPrefix with value ["cb","cbb","a"]', () {
    expect(longestCommonPrefix(["cb","cbb","a"]), '');
  });

  test('longestCommonPrefix with value ["a","b"]', () {
    expect(longestCommonPrefix(["a","b"]), '');
  });

  // "aa","aabc","aac","aac","aa"
  test('longestCommonPrefix with value ["aa","aabc","aac","aac","aa"]', () {
    expect(longestCommonPrefix(["aa","aabc","aac","aac","aa"]), 'aa');
  });

}
