import 'package:blood_pressure/src/constant/color/color.dart';
import 'package:flutter/material.dart';

import '../../../core/remote/response/doctor_response/doctor_response.dart';

import '../view_model/doctor_view_model.dart';
import '../../appointment/view/make_appointment.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  final DoctorViewModel _doctorViewModel = DoctorViewModel();
  late DoctorResponse doctorResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
            ),
            color: kDarkGreyColor,
            boxShadow: [const BoxShadow(blurRadius: 50.0)],
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(MediaQuery.of(context).size.width, 20)),
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
      body: FutureBuilder<DoctorResponse>(
        future: _doctorViewModel.getDoctor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.hasData) {
              doctorResponse = snapshot.data!;
              // Build UI using the retrieved products
              return buildUI(context);
            } else {
              return Text("no");
            }
          }
        },
      ),
    );
  }

  Widget buildUI(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius:
            BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'List the doctor..',
                style: TextStyle(color: kRedColor, fontSize: 20),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: doctorResponse.doctors!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120.0, // Độ rộng của các dấu ":"
                                  child: Text(
                                    "Name:",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${doctorResponse.doctors![index].fullName}",
                                  style:
                                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120.0, // Độ rộng của các dấu ":"
                                  child: Text(
                                    "Address:",
                                    style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                                  ),
                                ),
                                Text(
                                  "${doctorResponse.doctors![index].address}",
                                  style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120.0, // Độ rộng của các dấu ":"
                                  child: Text(
                                    "Phone NumBer:",
                                    style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                                  ),
                                ),
                                Text(
                                  "${doctorResponse.doctors![index].phoneNumber}",
                                  style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MakeAppointment(
                                    doctorId: doctorResponse.doctors![index].id,
                                    doctorName: doctorResponse.doctors![index].fullName!,
                                    address: doctorResponse.doctors![index].address!,
                                    phoneNumber: doctorResponse.doctors![index].phoneNumber,
                                  )),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
