part of 'services.dart';

class ReportServices {
  static CollectionReference reportCollection =
      Firestore.instance.collection('reports');

  static Future<void> saveReport(String id, Report report) async {
    await reportCollection.document().setData({
      'userID': id ?? "",
      'name': report.name ?? "",
      'distanceLocation': report.distanceLocation ?? 0,
      'batuk': report.batuk ?? 0,
      'sesakNapas': report.sesakNapas ?? 0,
      'tidur': report.tidur ?? 0,
      'suhu': report.suhu ?? 0,
      'valueGejala': report.valueGejala ?? 0,
      'note': report.catatan ?? "Tidak ada",
      'time': report.time ?? DateTime.now().millisecondsSinceEpoch,
    });
  }

  static Future<List<Report>> getReport(String userID) async {
    QuerySnapshot snapshot = await reportCollection.getDocuments();

    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    List<Report> reports = [];

    for (var document in documents) {
      reports.add(
        Report(
          document.data['name'],
          document.data['distanceLocation'],
          document.data['batuk'],
          document.data['sesakNapas'],
          document.data['tidur'],
          document.data['suhu'],
          document.data['valueGejala'],
          document.data['note'],
          document.data['time'],
        ),
      );
    }

    return reports;
  }
}
