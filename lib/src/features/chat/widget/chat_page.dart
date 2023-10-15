import 'package:flutter/material.dart';

import '../../../constant/component/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
    final int? doctorId;
  const ChatPage({super.key,required this.doctorId,});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBar(context, 'Doctor Name'),
       body: SingleChildScrollView(
         physics: const NeverScrollableScrollPhysics(),
         child: Column(
           
         ),
       ),
    );
  }
}