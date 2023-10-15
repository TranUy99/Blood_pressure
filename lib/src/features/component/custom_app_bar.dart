import 'package:flutter/material.dart';

import '../../constant/color/color.dart';

PreferredSizeWidget? appBar(BuildContext context, String title) {
  return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
         title: Text(title),
        backgroundColor: kSecondaryColor,
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
                bottom: Radius.elliptical(MediaQuery.of(context).size.width, 18)),
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
      ));
}
