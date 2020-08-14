part of 'extensions.dart';

extension StringExtensions on String {
  String capital() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
