extension StringExt on String {
  String capitalizeFirstLetter() {
    if (this.isEmpty) {
      return this;
    } else if (this.length == 1) {
      return this.toUpperCase();
    } else {
      return this[0].toUpperCase() + this.substring(1);
    }
  }

  List<String> getSubStrings(String pattern) {
    RegExp exp = RegExp(pattern);
    Iterable<RegExpMatch> matches = exp.allMatches(this);
    return matches.map((e) => e.input).toList();
  }
}
