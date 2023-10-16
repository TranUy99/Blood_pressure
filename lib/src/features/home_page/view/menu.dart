import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/color/color.dart';
import '../../appointment/view/schedule_appointment.dart';
import '../../blood_pressure/view/measure.dart';
import '../../doctor/view/doctor.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 216, 243, 248),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Measure(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kGreenColor, width: 2)),
                      height: 130,
                      width: 130,
                      child: const Image(
                        image: AssetImage('assets/icon/do huyet ap.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Doctor(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kGreenColor, width: 2)),
                      height: 130,
                      width: 130,
                      child: const Image(
                        image: AssetImage('assets/icon/appointment.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScheduleAppointment(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kGreenColor, width: 2)),
                      height: 130,
                      width: 130,
                      child: const Image(
                        image: AssetImage('assets/icon/schedule_appointment.jpg'),
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
