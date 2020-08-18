part of 'extensions.dart';

extension DateTimeExtensions on DateTime {
  String get dateAndTime => "${this.day} ${this.monthName} ${this.year}";
  String get dateAndTimeDay =>
      "${this.getDayName}, ${this.day} ${this.monthName} ${this.year}";
  String get getDayName {
    switch (this.weekday) {
      case 1:
        return 'Sen';
      case 2:
        return 'Sel';
      case 3:
        return 'Rab';
      case 4:
        return 'Kam';
      case 5:
        return 'Jum';
      case 6:
        return 'Sab';
      default:
        return 'Ming';
    }
  }

  String get monthName {
    switch (this.month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      default:
        return 'Desember';
    }
  }
}
