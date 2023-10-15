import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBar(context, 'Diagnostic'),
       body: SingleChildScrollView(
         physics: const NeverScrollableScrollPhysics(),
         child: Column(
           
         ),
       ),
    );
  }
}