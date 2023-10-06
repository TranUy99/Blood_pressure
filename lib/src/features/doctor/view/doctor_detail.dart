import 'package:blood_pressure/src/constant/color/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String workDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  void _shoDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        workDate = DateFormat("dd/MM/yyyy").format(value!);
      });
    });
  }

  var timeType;
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
                      width: 120.0, // Độ rộng của các dấu ":"
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
                      width: 120.0, // Độ rộng của các dấu ":"
                      child: Text(
                        "Address:",
                        style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                      ),
                    ),
                    Text(
                      "${widget.address}",
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
                      "${widget.phoneNumber}",
                      style: TextStyle(color: Color.fromARGB(255, 39, 187, 88)),
                    ),
                  ],
                ),
                FutureBuilder<List<Schedule>>(
                  future: AppointmentServices()
                      .Schedules(context, widget.doctorId, workDate),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: _shoDataPicker,
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            workDate,
                            style: const TextStyle(fontSize: 20),
                          ),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedCard = index;
                                            timeType=
                                                snapshot.data![index].timeType!;
                                          });
                                        },
                                        child: Card(
                                          color: selectedCard == index
                                              ? Color.fromARGB(
                                                  255, 131, 189, 237)
                                              : Color.fromARGB(
                                                  255, 170, 231, 137),
                                          margin: const EdgeInsets.all(8),
                                          shadowColor: Color.fromARGB(
                                              255, 214, 123, 104),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Padding(
                                                  padding: EdgeInsets.all(8)),
                                              Text(snapshot
                                                  .data![index].timeType!)
                                                                  ],
                                                                ),
                                                              )),
                                                        
                                                        ],
                                                      );
                                                    }),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                   
              ]),
        ));
  }
}
