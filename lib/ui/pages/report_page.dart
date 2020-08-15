part of 'pages.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController batukController = TextEditingController();
  TextEditingController sesakNapasController = TextEditingController();
  TextEditingController tidurController = TextEditingController();
  TextEditingController suhuController = TextEditingController();

  DateTime time = DateTime.now();

  double valueGejala;
  double batuk;
  double sesakNapas;
  double tidur;
  double suhu;
  bool isReport;

  @override
  void initState() {
    super.initState();
    valueGejala = 0;
    tidur = 0;
    sesakNapas = 0;
    suhu = 0;
    batuk = 0;
    isReport = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(time.dateAndTime),
                FloatingActionButton(onPressed: () {
                  setState(() {
                    isReport = true;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
