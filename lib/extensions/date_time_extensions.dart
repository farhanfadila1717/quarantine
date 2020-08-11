part of 'extensions.dart';

extension DateTimeExtensions on DateTime {
  String get getDayName {
    switch (this.weekday) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      default:
        return 'Minggus';
    }
  }
}
