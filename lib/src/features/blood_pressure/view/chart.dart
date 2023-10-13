import 'package:blood_pressure/src/core/model/blood.dart';
import 'package:blood_pressure/src/core/remote/response/blood_response/get_blood_response.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../view_model/blood_view_model.dart';
import '../widget/history.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final BloodViewModel _bloodViewModel = BloodViewModel();
  late GetBloodResponse getBloodResponse;

  String parseday(date) {
    DateTime time = DateTime.parse(date);
    DateTime dt2 = time.add(const Duration(hours: 7));
    String hour = dt2.hour.toString();
    String minute = dt2.minute.toString();
    if (dt2.hour < 10) {
      hour = '0$hour';
    }
    if (dt2.minute < 10) {
      minute = '0$minute';
    }
    return '${dt2.day}/${dt2.month}/${dt2.year}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetBloodResponse>(
      future: _bloodViewModel.getBlood(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            getBloodResponse = snapshot.data!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return Text("no");
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Chart Data Blood Pressure'),
              series: <ChartSeries<BloodDTO, String>>[
                LineSeries(
                  dataSource: getBloodResponse.bloodPressure!,
                  xValueMapper: (BloodDTO chartdata, _) => parseday(chartdata.createDay),
                  yValueMapper: (BloodDTO chartdata, _) => chartdata.SystolicPressure,
                ),
                LineSeries(
                  dataSource: getBloodResponse.bloodPressure!,
                  xValueMapper: (BloodDTO chartdata, _) => parseday(chartdata.createDay),
                  yValueMapper: (BloodDTO chartdata, _) => chartdata.DiastolicPressure,
                ),
                LineSeries(
                  dataSource: getBloodResponse.bloodPressure!,
                  xValueMapper: (BloodDTO chartdata, _) => parseday(chartdata.createDay),
                  yValueMapper: (BloodDTO chartdata, _) => chartdata.PulsePressure,
                ),
                LineSeries(
                  dataSource: getBloodResponse.bloodPressure!,
                  xValueMapper: (BloodDTO chartdata, _) => parseday(chartdata.createDay),
                  yValueMapper: (BloodDTO chartdata, _) => chartdata.HeartRate,
                ),
                LineSeries(
                  dataSource: getBloodResponse.bloodPressure!,
                  xValueMapper: (BloodDTO chartdata, _) => parseday(chartdata.createDay),
                  yValueMapper: (BloodDTO chartdata, _) => chartdata.BodyTemperature,
                )
              ],
            ),
               const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Index:',
                        style: TextStyle(color: Color.fromARGB(255, 11, 11, 11)),
                      ),
                      Text(
                        'Sys-----:',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Dia-----',
                        style: TextStyle(color: Color.fromARGB(255, 160, 79, 87)),
                      ),
                      Text(
                        'Pulse-----',
                        style: TextStyle(color: Color.fromARGB(255, 154, 3, 3)),
                      ),
                    ],
                  ),
                ),
                const History()
          ],
        ),
      ),
    );
  }
}
