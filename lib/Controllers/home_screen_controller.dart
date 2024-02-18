import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/discovery_model.dart';
import '../Services/api_service.dart';

class HomeScreenController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final ScrollController scrollController = ScrollController();
  var hasMoreData = true.obs; // Track whether there is more data available
  var discoveryList = <DiscoveryModel>[].obs;
  var isLoading = true.obs;
  int page = 1;
  final int limit = 10;

  @override
  void onInit() {
    fetchDiscovery();
    // Add scroll listener
    scrollController.addListener(onScroll);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose(); // Dispose the scroll controller
    super.onClose();
  }

  Future<void> fetchDiscovery() async {
    try {
      isLoading(true);
      String url = "https://api-stg.together.buzz/mocks/discovery?page=$page&limit=$limit";
      final data = await _apiService.get(url);
      if (data['data'].isEmpty) {
        hasMoreData.value = false; // Update hasMoreData to indicate no more data

      } else {
        for (var i in data['data']) {
          discoveryList.add(DiscoveryModel.fromJson(i));
        }
        page++;
      }
    } catch (error) {
      // Handle error
      print(error.toString());
    } finally {
      isLoading(false);
    }
  }

  void onScroll() {
    if (scrollController.position.maxScrollExtent == scrollController.position.pixels &&
        hasMoreData.value && // Only fetch more data if there is more data available
        !isLoading.value) { // Ensure not to fetch data while already loading
      fetchDiscovery();
    }
  }
}
