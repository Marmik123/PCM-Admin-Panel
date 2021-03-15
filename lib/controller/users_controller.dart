import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pcm_admin/app_config.dart';

class UserController extends GetxController {
  int textFieldCount = 4;
  RxBool isActive = false.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool editUserFlag = false.obs;
  RxString typeOfRole = "".obs;
  RxList<ParseObject> distriInfo = <ParseObject>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString name = "".obs;
  RxString address = "".obs;
  RxString mobileNo = "".obs;
  RxString shopName = "".obs;
  RxString shopLocation = "".obs;
  QueryBuilder<ParseObject> distInfo =
      QueryBuilder<ParseObject>(ParseObject('UserMetadata'))
        ..whereEqualTo('role', 'Distributor')
        ..includeObject(['shopName']);

  QueryBuilder<ParseObject> clientInfo =
      QueryBuilder<ParseObject>(ParseObject('UserMetadata'))
        ..whereEqualTo('role', 'Client')
        ..includeObject(['shopName']);

  QueryBuilder<ParseObject> delInfo =
      QueryBuilder<ParseObject>(ParseObject('UserMetadata'))
        ..whereEqualTo('role', 'DeliveryBoy');

  QueryBuilder<ParseObject> salesInfo =
      QueryBuilder<ParseObject>(ParseObject('UserMetadata'))
        ..whereEqualTo('role', 'SalesPerson')
        ..includeObject(['shopName']);

  Future<void> loadUser(QueryBuilder<ParseObject> role) async {
    /*if (role == distInfo) {
      typeOfRole.value = "Distributor";
    } else if (role == clientInfo) {
      typeOfRole.value = "Client";
    } else if (role == delInfo) {
      typeOfRole.value = "DeliveryBoy";
    } else {
      typeOfRole.value = "SalesPerson";
    }*/
    isLoading.value = true;
    print("called load fb data");
    try {
      print("execute try");
      ParseResponse result = await role.query();
      print(result.result);
      if (result.success) {
        print("if block ");
        isLoading.value = false;
        print(result.results);
        // ignore: deprecated_member_use
        distriInfo(result.results);
        //print("distrinfo called ${distriInfo[0].get('shop').get('shopName')}");
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

  Future<void> registerUser(String role) async {
    isLoading.value = true;
    try {
      ParseObject adData = ParseObject('UserMetadata')
        ..set('name', name)
        ..set('number', mobileNo)
        ..set('address1', address)
        ..set('shopName', shopName)
        ..set('role', role);
      ParseResponse adResult = await adData.create();
      if (adResult.success) {
        isLoading.value = false;
        Get.back();
        if (role == "Client") {
          loadUser(clientInfo);
        } else if (role == "Distributor") {
          loadUser(distInfo);
        } else if (role == "SalesPerson") {
          loadUser(salesInfo);
        } else {
          loadUser(delInfo);
        }
      } else
        return null;
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

  Future<void> editUser(ParseObject object, String role) async {
    isLoading.value = true;
    try {
      object
        ..set('name', name)
        ..set('number', mobileNo)
        ..set('address1', address)
        ..set('shopName', shopName)
        ..set('role', role);
      ParseResponse adResult = await object.save();
      if (adResult.success) {
        isLoading.value = false;
        if (role == "Client") {
          loadUser(clientInfo);
        } else if (role == "Distributor") {
          loadUser(distInfo);
        } else if (role == "SalesPerson") {
          loadUser(salesInfo);
        } else {
          loadUser(delInfo);
        }
        Get.back();
      } else
        return null;
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

  Future<void> chooseFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print(result);
      try {
        print('try executed');
        var file = Image.memory(result.files.single.bytes);
        print(file);
        /* filename = result.files.single.name;
        print(filename);
        fileList.add(file);
        print(fileList.length);
        print('sdsssdsds $fileList');*/
      } catch (e) {
        print(e);
        return e;
      }
    } else {
      // User canceled the picker
    }
  }
}
