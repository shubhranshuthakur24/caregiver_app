class StringManipulation {
  static List<String> nameSplit({required String fullname}) {
    List<String> nameList = [];
    try {
      int idx = fullname.indexOf(" ");
      nameList = [fullname.substring(0, idx).trim(), fullname.substring(idx + 1).trim()];
    } catch (error) {
      nameList.add(fullname.trim());
      nameList.add("");
    }
    return nameList;
  }

  static String trimText({required String string, required int StringLength}) {
    try {
      return string.substring(0, StringLength) + "...";
    } catch (error) {
      return string;
    }
  }
}
