import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../constant/color/color.dart';

import '../view_model/blood_view_model.dart';
import '../widget/flolowBlood.dart';

class BloodPage extends StatefulWidget {
  const BloodPage({super.key});

  @override
  State<BloodPage> createState() => _BloodPageState();
}

class _BloodPageState extends State<BloodPage> {
  //  final BloodPageService bloodPageService = BloodPageService();
  double sys = 70;
  double dia = 60;
  double pulse = 40;
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
                    value: sys,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Systolic'),
                    onChanged: (value) {
                      setState(() {
                        sys = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinBox(
                    max: 200,
                    value: dia,
                    min: 1,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Diastolic'),
                    onChanged: (value) {
                      setState(() {
                        dia = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinBox(
                    max: 250,
                    value: pulse,
                    min: 40,
                    decimals: 1,
                    decoration: const InputDecoration(labelText: 'Pulse'),
                    onChanged: (value) {
                      setState(() {
                        pulse = value;
                      });
                    },
                  ),
                ),
                InkWell(
                    onTap: () async {
                      final bool signUpStatus = await _bloodViewModel.createBlood(
                        sys,
                        dia,
                        pulse,
                        createDay,
                      );

                      if (signUpStatus == true) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message: ' success',
                          ),
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FollowBloodPressure(sys: sys, dia: dia, pulse: pulse)),
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
