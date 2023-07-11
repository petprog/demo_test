extension IntExtension on int {
  bool get isSuccessful {
    return (this) >= 200 && (this) <= 300;
  }

  String toOrdinal() {
    final n = this;
    if (n >= 11 && n <= 13) {
      return 'th';
    } else {
      switch (n % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }
  }
}
