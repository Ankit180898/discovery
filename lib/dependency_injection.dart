import 'package:get/get.dart';
import 'Controllers/internet_controller.dart';
import 'Services/api_service.dart';

class DependencyInjection{
  static void init(){
    Get.put<InternetController>(InternetController(),permanent: true);
    Get.put<ApiService>(ApiService(),permanent: true);

  }
}