import 'dart:developer';

import 'package:blood_pressure/src/constant/color/color.dart';
import 'package:blood_pressure/src/core/remote/response/schedule_response.dart/schedule_response.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../view_model/doctor_view_model.dart';

class DoctorDetailPage extends StatefulWidget {
  final int? doctorId;
  final String? doctorName;
  final String? address;
  final String? phoneNumber;
  // final String isAvailable;
  const DoctorDetailPage({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.address,
    required this.phoneNumber,
    // required this.isAvailable
  });

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  DoctorViewModel _doctorViewModel = DoctorViewModel();

  String workDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  void _shoDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        workDate = DateFormat("dd/MM/yyyy").format(value!);
      });
    });
  }

  var time;
  int? selectedScheduleId;
  var selectedCard = -1;
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
            boxShadow: const [BoxShadow(blurRadius: 50.0)],
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
      body: buildUI(context),
    );
  }

  Widget buildUI(BuildContext context) {
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 120.0,
                      child: Text(
                        "Name:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${widget.doctorName}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(
                      width: 120.0,
                      child: Text(
                        "Address:",
                        style: TextStyle(color: kGreenColor),
                      ),
                    ),
                    Text(
                      "${widget.address}",
                      style: const TextStyle(color: kGreenColor),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(
                      width: 120.0,
                      child: Text(
                        "Phone NumBer:",
                        style: TextStyle(color: kGreenColor),
                      ),
                    ),
                    Text(
                      "${widget.phoneNumber}",
                      style: const TextStyle(color: kGreenColor),
                    ),
                  ],
                ),
                FutureBuilder<ScheduleResponse>(
                  future: _doctorViewModel.getSchedule(widget.doctorId, workDate),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 450,
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: _shoDataPicker,
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Choose Date',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              workDate,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: snapshot.data!.schedule!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedScheduleId = snapshot.data!.schedule![index].id;
                                        time = snapshot.data!.schedule![index].time!;
                                        selectedCard = index;
                                      });
                                    },
                                    child: Card(
                                      color: selectedCard == index ? kBlueBlandColor : kGreenColor,
                                      margin: const EdgeInsets.all(8),
                                      shadowColor: kRedColor,
                                      child: Container(
                                        height: 50,
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data!.schedule![index].time!,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  final int? scheduleId = selectedScheduleId;
                                  log("scheduleId $scheduleId");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kBlueColor,
                                  ),
                                  child: Text(
                                    "Make appointment",
                                    style: textButton.copyWith(color: kWhiteColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
              ]),
        ));
  }
}
