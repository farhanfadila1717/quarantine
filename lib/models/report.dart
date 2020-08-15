part of 'models.dart';

class Report extends Equatable {
  final String name;
  final int distanceLocation;
  final double batuk;
  final double sesakNapas;
  final double tidur;
  final double suhu;
  final double valueGejala;
  final String catatan;
  final int time;

  Report(this.name, this.distanceLocation, this.batuk, this.sesakNapas,
      this.suhu, this.tidur, this.valueGejala, this.catatan, this.time);

  Report copyWith({
    String name,
    int distanceLocation,
    double batuk,
    double sesakNapas,
    double tidur,
    double suhu,
    double valueGejala,
    String catatan,
    int time,
  }) =>
      Report(
          name ?? this.name,
          distanceLocation ?? this.distanceLocation,
          batuk ?? this.batuk,
          sesakNapas ?? this.sesakNapas,
          suhu ?? this.suhu,
          tidur ?? this.tidur,
          valueGejala ?? this.valueGejala,
          catatan ?? this.catatan,
          time ?? this.time);
  @override
  List<Object> get props => [
        name,
        distanceLocation,
        batuk,
        sesakNapas,
        suhu,
        tidur,
        valueGejala,
        catatan,
        time,
      ];
}
