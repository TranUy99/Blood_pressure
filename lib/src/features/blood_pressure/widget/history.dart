import 'package:flutter/material.dart';

import '../../../core/remote/response/blood_response/get_blood_response.dart';
import '../view_model/blood_view_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final BloodViewModel _bloodViewModel = BloodViewModel();
  late GetBloodResponse getBloodResponse;

  String parseDate(date) {
    DateTime time = DateTime.parse(date);
    DateTime dt2 = time.add(const Duration(hours: 0));
    String hour = dt2.hour.toString();
    String minute = dt2.minute.toString();
    if (dt2.hour < 10) {
      hour = '0$hour';
    }
    if (dt2.minute < 10) {
      minute = '0$minute';
    }
    return '$hour:$minute, ${dt2.day}/${dt2.month}/${dt2.year}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetBloodResponse>(
      future: _bloodViewModel.getBloodReverse(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'The history:',
          style: TextStyle(fontSize: 15),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: getBloodResponse.bloodPressure!.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(
                    (parseDate(getBloodResponse.bloodPressure![index].createDay)),
                    style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7), fontSize: 18),
                  ),
                  Text(
                      'Blood Pressure:${getBloodResponse.bloodPressure![index].SystolicPressure}/${getBloodResponse.bloodPressure![index].DiastolicPressure}'),
                  Text('Pulse:${getBloodResponse.bloodPressure![index].PulsePressure}'),
                  Text('Heart Rate:${getBloodResponse.bloodPressure![index].HeartRate}'),
                  Text('Body Temperature:${getBloodResponse.bloodPressure![index].BodyTemperature}'),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
