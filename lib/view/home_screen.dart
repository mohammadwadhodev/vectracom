import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:vectracom_test/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flip_card/flip_card.dart';
import 'package:vectracom_test/models/get_posts_model.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavyBar(
            selectedIndex: controller.currentIndex.value,
            mainAxisAlignment: MainAxisAlignment.center,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) {
              controller.currentIndex.value = index;
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(Icons.apps),
                title: const Text('Home'),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                title: const Text('Settings'),
                activeColor: Colors.blue,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        body: Obx(
          () => Center(
            child: controller.widgetOptions
                .elementAt(controller.currentIndex.value),
          ),
        ),
      ),
    );
  }

  Widget changeTheme() {
    return MaterialButton(child: const Text("change Theme"), onPressed: () {});
  }
}

class PostDetailScreen extends StatelessWidget {
  GetPostsModel postsModel = GetPostsModel();
  String tag;
  PostDetailScreen({Key? key, required this.postsModel, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: tag,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 445,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image:
                                NetworkImage(postsModel.imageLink.toString()))),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Name : ${postsModel.name}",
                    style: const TextStyle(color: Colors.white, fontSize: 17)),
                const SizedBox(height: 20),
                Text("Habitat : ${postsModel.habitat}",
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
                const SizedBox(height: 20),
                Text("Diet : ${postsModel.diet}",
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
                const SizedBox(height: 30),
              ],
            ),
          )),
    );
  }
}
