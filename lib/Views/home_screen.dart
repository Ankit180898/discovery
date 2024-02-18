import 'package:discovery/Controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovery"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (homeScreenController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ListView.builder(
              controller: homeScreenController.scrollController,
              itemCount: homeScreenController.hasMoreData.value? homeScreenController.discoveryList.length + 1:homeScreenController.discoveryList.length,
              itemBuilder: (context, index) {
                if (index < homeScreenController.discoveryList.length) {
                  var item = homeScreenController.discoveryList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Image.network("${item.imageUrl}"),
                          title: Text(item.title.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          subtitle: Text(item.description.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        }
      }),
    );
  }
}
