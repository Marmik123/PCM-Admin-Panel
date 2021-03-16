import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../app_config.dart';

class ManageAdvertiseController extends GetxController {
  RxString adNameValue = "".obs;
  RxString adDescriptionValue = "".obs;
  RxBool isLoading = false.obs;
  int textFieldCount = 2;
  TextEditingController adNameController = TextEditingController();
  TextEditingController adDescriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  QueryBuilder<ParseObject> adData =
      QueryBuilder<ParseObject>(ParseObject('Advertisement'))
        ..orderByDescending('createdAt');

  RxList<ParseObject> adsData = <ParseObject>[].obs;

/*  void addAdvertise(adName, adDesc) {
    final newAd = ParseObject(adName, adDesc);
    adsData.add(newAd);
  }*/

  Future<void> registerAd() async {
    isLoading.value = true;
    try {
      ParseObject adData = ParseObject('Advertisement')
        ..set('adName', adNameValue)
        ..set('adDescription', adDescriptionValue);
      ParseResponse adResult = await adData.create();
      if (adResult.success) {
        isLoading.value = false;
        Get.back();
        loadAdData();
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

  Future<void> deleteAd(ParseObject object) async {
    isLoading.value = true;
    try {
      ParseResponse adResult = await object.delete();
      if (adResult.success) {
        isLoading.value = false;
        loadAdData();
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

  Future<void> editAd(ParseObject object) async {
    isLoading.value = true;
    try {
      object
        ..set('adName', adNameValue)
        ..set('adDescription', adDescriptionValue);
      ParseResponse adResult = await object.save();
      if (adResult.success) {
        isLoading.value = false;
        loadAdData();
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

  Future<void> loadAdData() async {
    isLoading.value = true;
    print("called load ad data");
    try {
      print("execute try");
      ParseResponse result = await adData.query();
      print(result.result);
      if (result.success) {
        print("if block ");
        isLoading.value = false;

        // ignore: deprecated_member_use
        if (!result.isBlank) {
          adsData.value = result.results;
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
        print("this is the list $adsData");
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
