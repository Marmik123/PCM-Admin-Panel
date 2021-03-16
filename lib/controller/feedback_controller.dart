import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../app_config.dart';

class FeedBackController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ParseObject> fbList = <ParseObject>[].obs;
  RxList userList = [].obs;

  QueryBuilder<ParseObject> fbData =
      QueryBuilder<ParseObject>(ParseObject('Feedback'))
        ..orderByDescending('createdAt')
        ..includeObject(['userData']);

  /*Future<void> getUserData(index) async {
    QueryBuilder<ParseObject> userData =
        QueryBuilder<ParseObject>(ParseObject('_User'))
          ..whereEqualTo('objectId', fbList[index]['userData']['objectId']);

    try {
      ParseResponse response = await userData.query();
      if (response.success) {
        print("User data Details");
        print(response.result);
        // ignore: deprecated_member_use
        userList.value = response.results;
      }
    } catch (e) {
      return e;
    }
  }*/
  void onInit() {
    loadFeedBack();
  }

  Future<void> loadFeedBack() async {
    isLoading.value = true;
    print("called load fb data");
    try {
      print("execute try");
      ParseResponse result = await fbData.query();
      print(result.result);
      if (result.success) {
        print("if block ");
        isLoading.value = false;

        // ignore: deprecated_member_use
        fbList.value = result.results;
      } else {
        isLoading.value = false;
        final snackBar = SnackBar(
          content: Text(
            "Error ! Please try again.",
            style: kInterText,
          ),
          elevation: 20.0,
          backgroundColor: Colors.cyan,
        );
        ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
      }
    } catch (e) {
      isLoading.value = false;
      print("default error---" + e);
      final snackBar = SnackBar(
        content: Text(
          "Error ! Please try again.",
          style: kInterText,
        ),
        elevation: 20.0,
        backgroundColor: Colors.cyan,
      );
      ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
    } finally {
      print("Finally executed");
    }
  }

  Future<void> deleteFeedBack(ParseObject object) async {
    isLoading.value = true;
    try {
      ParseResponse adResult = await object.delete();
      if (adResult.success) {
        isLoading.value = false;
        loadFeedBack();
        Get.back();
      } else {
        isLoading.value = false;
        final snackBar = SnackBar(
          content: Text(
            "Error ! Please try again.",
            style: kInterText,
          ),
          elevation: 20.0,
          backgroundColor: Colors.cyan,
        );
        ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
      }
    } catch (e) {
      isLoading.value = false;
      print("default error---" + e);
      final snackBar = SnackBar(
        content: Text(
          "Error ! Please try again.",
          style: kInterText,
        ),
        elevation: 20.0,
        backgroundColor: Colors.cyan,
      );
      ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
    } finally {
      print("Finally executed");
    }
  }
}
