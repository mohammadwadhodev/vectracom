import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vectracom_test/services/api_service.dart';
import 'dart:convert';

import '../constants/shared_preferences.dart';
import '../models/get_posts_model.dart';
import '../view/home_screen.dart';

class HomeScreenController extends GetxController {
  String screenName = '';
  RxInt currentIndex = 0.obs;
  RxList<GetPostsModel> getPostsModelList = RxList<GetPostsModel>();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 600);
  List<String> tags = [];
  List<Widget> widgetOptions = <Widget>[];
  RxBool isLoading = false.obs;
  RxBool switchValue = false.obs;

  @override
  void onInit() {
    checkThemeData();
    getPosts();
    widgetOptions.add(postDetailCard());
    widgetOptions.add(changeThemeButton());
    super.onInit();
  }

  void checkThemeData() async {
    String? theme = await checkTheme();
    if (theme == 'dark') {
      switchValue.value = true;
    } else {
      switchValue.value = false;
    }
  }

  getPosts() async {
    isLoading.value = true;
    ApiService apiService = ApiService();
    getPostsModelList.value = await apiService.getPostsFromApi();
    isLoading.value = false;
  }

  Widget postDetailCard() {
    return Obx(
      () => SizedBox(
          height: 500,
          child: isLoading.value == false
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: getPostsModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    tags.add('aven$index');
                    GlobalKey<FlipCardState> cardKey =
                        GlobalKey<FlipCardState>();
                    return Center(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 445,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: GestureDetector(
                            onTap: () {
                              cardKey.currentState?.toggleCard();
                            },
                            onDoubleTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetailScreen(
                                        postsModel: getPostsModelList[index],
                                        tag: tags[index])),
                              );
                            },
                            child: FlipCard(
                              key: cardKey,
                              flipOnTouch: false,
                              direction: FlipDirection.HORIZONTAL,
                              front: Center(
                                child: Hero(
                                  tag: tags[index],
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(
                                                getPostsModelList[index]
                                                    .imageLink
                                                    .toString()))),
                                  ),
                                ),
                              ),
                              back: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            getPostsModelList[index]
                                                .imageLink
                                                .toString()))),
                              ),
                            ),
                          )),
                    );
                  })
              : const Center(child: CircularProgressIndicator())),
    );
  }

  Widget changeThemeButton() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Change Theme"),
          Switch(
            value: switchValue.value,
            onChanged: (value) {
              switchValue.value = value;
              changeTheme(value);
            },
          )
        ],
      ),
    );
  }
}
