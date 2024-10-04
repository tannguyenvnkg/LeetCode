main() {
  print(longestCommonPrefix(["aa","aabc","aac","aac","aa"]));
}

String longestCommonPrefix(List<String> strs) {
  String compareStr = strs[0];
  String value = '';
  bool skip = false;

  if (strs.where((element) => element.isEmpty).isNotEmpty) {
    return '';
  }

  strs
    ..removeAt(0)
    ..forEach((stringAtIndex) {
      if(skip) return;
      // use the smaller string to compare
      int size = compareStr.length > stringAtIndex.length
          ? stringAtIndex.length
          : compareStr.length;
      for (int j = 0; j < size; j++) {
        if(j == 0 && compareStr[j] != stringAtIndex[j]) {
          compareStr = '';
          skip = true;
          break;
        }
        if (compareStr[j] == stringAtIndex[j]) {
          value += stringAtIndex[j];
          if (j == size - 1) {
            compareStr = value;
            value = '';
          }
        } else {
          compareStr = value;
          value = '';
          break;
        }
      }
    });
  return compareStr;
}
