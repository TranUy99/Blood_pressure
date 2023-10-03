import 'package:blood_pressure/src/core/network/network_manager.dart';
import 'package:get/get.dart';



class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}