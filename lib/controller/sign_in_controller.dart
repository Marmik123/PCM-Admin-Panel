import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pcm_admin/app_config.dart';
import 'package:pcm_admin/view/home_screen.dart';

class SignInController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool hidePassword = true.obs;
  RxBool isLoading = false.obs;
  RxBool forgotPassword = false.obs;
  RxBool hideConfirmPassword = false.obs;
  int textFieldCount = 2;
  Future<ParseUser> login(String username, String password) async {
    try {
      var user = ParseUser(username, password, null);
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        isLoading.value = true;
        var result = await user.login();
        if (result.success) {
          isLoading.value = false;
          print(user.objectId);
          var userParse = user;
          Get.to(HomeScreen());
        } else {
          isLoading.value = false;
          final snackBar = SnackBar(
            content: Text(
              "Error ! Please try again with correct credentials",
              style: kInterText,
            ),
            elevation: 20.0,
            backgroundColor: Colors.cyan,
          );
          ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
          return null;
        }
      }
    } catch (e) {
      print("Error occured ${e}");
    } finally {
      isLoading.value = false;
    }
  }
}
