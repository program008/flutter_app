extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  /// To create a local extension that’s visible only in the library
  /// where it’s declared, either omit the extension name or give it a name
  /// that starts with an underscore (_).
  double _parseDouble() {
    return double.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}
