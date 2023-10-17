import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../constant/component/custom_app_bar.dart';
import '../../../core/remote/response/booking_response/get_booking_reponse.dart';
import '../view_model/booking_view_model.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  final BookingViewModel _bookingViewModel = BookingViewModel();
  late GetBookingResponse getBooking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Schedule an appointment'),
      body: FutureBuilder<GetBookingResponse>(
        future: _bookingViewModel.getBooking(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.hasData) {
              getBooking = snapshot.data!;
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
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getBooking.bookings!.length,
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
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${getBooking.bookings![index].schedule!.doctor!.fullName}",
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120.0, // Độ rộng của các dấu ":"
                                  child: Text(
                                    "workDate:",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${getBooking.bookings![index].schedule!.workDate}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: kGreenColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120.0, // Độ rộng của các dấu ":"
                                  child: Text(
                                    "Time:",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${getBooking.bookings![index].schedule!.time}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: kGreenColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                      onTap: () {},
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
