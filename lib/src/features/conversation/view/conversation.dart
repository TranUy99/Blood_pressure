import 'package:blood_pressure/src/features/conversation/view/call.dart';
import 'package:blood_pressure/src/features/conversation/view/camera.dart';
import 'package:blood_pressure/src/features/conversation/view/chat.dart';
import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          title: const Text('Chat with doctor'),
          backgroundColor: Color.fromARGB(117, 100, 193, 234),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.phone)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [Camera(), Chat(), Call()],
        ),
      ),
    );
  }
}
