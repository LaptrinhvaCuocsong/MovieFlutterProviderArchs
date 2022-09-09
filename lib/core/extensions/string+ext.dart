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
}
