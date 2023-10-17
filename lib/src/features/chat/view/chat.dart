import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../core/remote/response/doctor_response/doctor_response.dart';
import '../../doctor/view_model/doctor_view_model.dart';
import 'message_page.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final DoctorViewModel _doctorViewModel = DoctorViewModel();
  late DoctorResponse doctorResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return const Text("no");
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
                            ListTile(
                              leading: const CircleAvatar(
                                radius: 25,
                              ),
                              title: Text(
                                "${doctorResponse.doctors![index].fullName} ",
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Row(
                                children: [
                                  Icon(Icons.done_all),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Hi ",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              trailing: const Text("16:00"),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  MessagePage(doctorId: doctorResponse.doctors![index].id,)),
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
