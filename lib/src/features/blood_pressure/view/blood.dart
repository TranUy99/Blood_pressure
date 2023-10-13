// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../constant/color/color.dart';

import '../../../core/remote/response/blood_response/blood_response.dart';
import '../view_model/blood_view_model.dart';
import '../widget/flolowBlood.dart';

class BloodPage extends StatefulWidget {
  const BloodPage({super.key});

  @override
  State<BloodPage> createState() => _BloodPageState();
}

class _BloodPageState extends State<BloodPage> {
  //  final BloodPageService bloodPageService = BloodPageService();

  double SystolicPressure = 70;
  double DiastolicPressure = 60;
  double PulsePressure = 40;
  double HeartRate = 80;
  double BodyTemperature = 36.1;
  final BloodViewModel _bloodViewModel = BloodViewModel();
  String? createDay = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 242, 243),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Column(
                  children: [
                    Text(
                      'Cardiologists recommend resting for at least 15 minutes before measuring',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 233, 17, 17),
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Column(
                  children: [
                    Text(
                      'Enter 3 blood pressure readings',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 13, 13, 13),
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinBox(
                    max: 300,
                    value: SystolicPressure,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Systolic'),
                    onChanged: (value) {
                      setState(() {
                        SystolicPressure = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinBox(
                    max: 200,
                    value: DiastolicPressure,
                    min: 1,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Diastolic'),
                    onChanged: (value) {
                      setState(() {
                        DiastolicPressure = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinBox(
                    max: 250,
                    value: PulsePressure,
                    min: 40,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Pulse'),
                    onChanged: (value) {
                      setState(() {
                        PulsePressure = value;
                      });
                    },
                  ),
                ),
                InkWell(
                    onTap: () async {
                      final BloodResponse createBloodResponse = await _bloodViewModel.createBlood(
                        SystolicPressure,
                        DiastolicPressure,
                        PulsePressure,
                        HeartRate,
                        BodyTemperature,
                        createDay,
                      );

                      if (createBloodResponse.errCode == 0) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message: ' success',
                          ),
                        );
                      
                       
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FollowBloodPressure(id: createBloodResponse.bloodPressure!.id, )),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: 'You need to log in',
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: 50,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(16), color: kBlueColor),
                      child: Text(
                        "Save",
                        style: textButton.copyWith(color: kWhiteColor),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
