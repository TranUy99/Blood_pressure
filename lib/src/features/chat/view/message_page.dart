import 'package:blood_pressure/src/core/remote/response/message_response/get_message_response.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../constant/component/custom_app_bar.dart';
import '../view_model/message_view_model.dart';
import '../widget/doctor_message.dart';
import '../widget/user_message.dart';

class MessagePage extends StatefulWidget {
  final int? doctorId;
  const MessagePage({
    super.key,
    required this.doctorId,
  });

  @override
  State<MessagePage> createState() => _ChatPageState();
}

class _ChatPageState extends State<MessagePage> {
  final MessageViewModel _messageViewModel = MessageViewModel();
  GetMessageResponse getMessageResponse = GetMessageResponse();
  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: kGreyColor,
        appBar: appBar(context, 'Doctor Name'),
        body: FutureBuilder<GetMessageResponse>(
          future: _messageViewModel.getMessage(1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.hasData) {
                getMessageResponse = snapshot.data!;
                // Build UI using the retrieved products
                return buildUI(context);
              } else {
                return const Text("no");
              }
            }
          },
        ),
      ),
    ]);
  }

  Widget buildUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   itemCount: getMessageResponse.messages!.length + 1,
          //   itemBuilder: (context, index) {
          //     if (index == getMessageResponse.messages!.length) {
          //       return Container(
          //         height: 70,
          //       );
          //     }
          //     if (getMessageResponse.messages![index].senderType == "user") {
          //       return UserMessage(
          //         message: getMessageResponse.messages![index].content!,
          //       );
          //     } else {
          //       return DoctorMessage(
          //         message: getMessageResponse.messages![index].content!,
          //       );
          //     }
          //   },
          // ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Card(
                    margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
