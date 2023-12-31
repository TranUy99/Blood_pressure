import 'package:blood_pressure/src/features/home_page/view/home_page.dart';
import 'package:blood_pressure/src/features/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color/color.dart';
import '../../../core/network/network_manager.dart';
import '../../conversation/view/conversation.dart';
import '../../login/bloc/login_bloc.dart';
import '../../login/view/not_login.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

int indexScreen = 0;
List appScreens = [];

class _NavigationHomePageState extends State<NavigationHomePage> {
  final LoginBloc loginBloc = LoginBloc();
  final NetworkController _networkController = Get.put(NetworkController());
  String? email;
  int? id;
  String? token;

  List navigationLoginScreen() {
    return appScreens = [
      const HomePage(),
      const Conversation(),
      const Profile()
    ];
  }

  List navigationLogoutScreen() {
    return appScreens = [const HomePage(), const NotLogin(), const NotLogin()];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    bool checkInternetConnection =
        _networkController.connectionType.value == "No Internet Connection";
    return checkInternetConnection == false
        ? Scaffold(
            body: (successLoginState.onLoginState )
                ? navigationLoginScreen()[indexScreen]
                : navigationLogoutScreen()[indexScreen],
            bottomNavigationBar: NavigationBar(
              height: MediaQuery.of(context).size.height * 0.07,
              onDestinationSelected: (value) => setState(() {
                indexScreen = value;
              }),
              indicatorColor: const Color.fromARGB(100, 233, 233, 233),
              selectedIndex: indexScreen,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, size: 35),
                  label: 'Home',
                  selectedIcon: Icon(
                    Icons.home,
                    size: 35,
                    color: kGreyColor,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.chat_bubble_outline, size: 35),
                  label: 'Conversation',
                  selectedIcon: Icon(
                    Icons.chat_bubble,
                    size: 35,
                    color: kGreyColor,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined, size: 35),
                  label: 'Me',
                  selectedIcon: Icon(
                    Icons.account_circle,
                    size: 35,
                    color: kGreyColor,
                  ),
                )
              ],
            ),
          )
        : // Handle the case when there is no internet connection, e.g., show a different widget or an error message.
        Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Please check internet connection',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationHomePage(),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kGreenColor),
                      child: const Text('Reload')),
                ],
              ),
            ),
          );
  }
}