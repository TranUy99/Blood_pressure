// ignore: file_names
import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../core/remote/response/blood_response/blood_response.dart';
import '../view_model/blood_view_model.dart';

class FollowBloodPressure extends StatefulWidget {
  final int? id;

  const FollowBloodPressure({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<FollowBloodPressure> createState() => _FollowBloodPressureState();
}

class _FollowBloodPressureState extends State<FollowBloodPressure> {
  DateTime now = DateTime.now();
  String parseDate(date) {
    DateTime dt2 = now.add(const Duration(hours: 0));
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

  final BloodViewModel _bloodViewModel = BloodViewModel();
  late BloodResponse getBloodResponse;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BloodResponse>(
      future: _bloodViewModel.getBloodById(widget.id),
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
            return const Text("no");
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
            ),
            color: kDarkGreyColor,
            boxShadow: const [BoxShadow(blurRadius: 50.0)],
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(MediaQuery.of(context).size.width, 18)),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'The result just measured',
                    style: TextStyle(
                      fontSize: 20,
                      color: kBlackColor,
                    ),
                  ),
                  Text(parseDate(now)),
                ],
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: kBlueBlandColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Blood Pressure',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kBlackColor,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                '${getBloodResponse.bloodPressure!.SystolicPressure}/${getBloodResponse.bloodPressure!.DiastolicPressure}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: kBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black54, //color of divider
                      width: 10, //width space of divider
                      thickness: 2, //thickness of divier line
                      indent: 10, //Spacing at the top of divider.
                      endIndent: 10, //Spacing at the bottom of divider.
                    ),
                    Expanded(
                      child: Card(
                        color: kBlueBlandColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Pulse Pressure',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kBlackColor,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "${getBloodResponse.bloodPressure!.PulsePressure}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: kBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: kBlueBlandColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Heart Rate',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kBlackColor,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                '${getBloodResponse.bloodPressure!.HeartRate}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: kBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black54, //color of divider
                      width: 10, //width space of divider
                      thickness: 2, //thickness of divier line
                      indent: 10, //Spacing at the top of divider.
                      endIndent: 10, //Spacing at the bottom of divider.
                    ),
                    Expanded(
                      child: Card(
                        color: kBlueBlandColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Temperature',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kBlackColor
                                  ,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "${getBloodResponse.bloodPressure!.BodyTemperature}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: kBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Text(
                  'Diagnosis based on data',
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${getBloodResponse.bloodPressure!.Disease}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: kRedColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
