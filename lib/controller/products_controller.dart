import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../app_config.dart';

class ProductsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList productsList = [].obs;
  int textFieldCount = 2;
  RxString proNameValue = "".obs;
  String filename;
  RxList<dynamic> fileList = [].obs;
  RxString proDescriptionValue = "".obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  QueryBuilder<ParseObject> proData =
      QueryBuilder<ParseObject>(ParseObject('Products'))
        ..orderByDescending('createdAt');

  Future<void> registerPro() async {
    print("register product called");
    isLoading.value = true;
    try {
      print("trying to register");
      List<ParseWebFile> fileListData = List.generate(
          fileList.length, (index) => fileList[index]
          /*ParseWebFile(
                fileList()[index],
                name: basename(fileList()[index].path),
              )*/
          );
      print("Here is filelistData");
      print(fileListData);
      ParseObject proData = ParseObject('Products')
        ..set('productName', proNameValue)
        ..set('productDesc', proDescriptionValue);
      proData.setAddAll("fileImage", fileListData);
      //proData.set<List<ParseWebFile>>("fileImages", fileListData);
      ParseResponse adResult = await proData.create();
      if (adResult.success) {
        isLoading.value = false;
        loadPro();
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

  Future<void> loadPro() async {
    isLoading.value = true;
    print("called load product data");
    try {
      print("execute try");
      ParseResponse result = await proData.query();
      print(result);
      print("result starts");
      print(result.results);
      print("result end");
      if (result.success) {
        print("if block ");
        isLoading.value = false;

        // ignore: deprecated_member_use
        productsList(result.results);
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

  Future<void> editPro(ParseObject object) async {
    isLoading.value = true;
    try {
      object
        ..set('productName', proNameValue)
        ..set('productDesc', proDescriptionValue)
        ..set('productPhoto',
            List.generate(fileList.length, (index) => fileList[index]));
      ParseResponse adResult = await object.save();
      if (adResult.success) {
        isLoading.value = false;
        loadPro();
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

  Future<void> deletePro(ParseObject object) async {
    isLoading.value = true;
    try {
      ParseResponse adResult = await object.delete();
      if (adResult.success) {
        isLoading.value = false;
        loadPro();
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

  Future<void> chooseFile() async {
    //FilePickerResult result = await FilePicker.platform.pickFiles();
    PickedFile result =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    ParseFileBase parseFile;
    if (result != null) {
      print(result);
      try {
        print('try executed');
        //var file = Image.memory(result.files.single.bytes);
        ParseWebFile file = ParseWebFile(null, name: null, url: result.path);
        await file.download();
        parseFile = ParseWebFile(file.file, name: file.name);
        print(file);
        print("parseFile is $parseFile");
        //filename = result.files.single.name;
        //print(filename);
        fileList.add(parseFile);
        print(fileList.length);
        print('sdsssdsds $fileList');
        proData.selectKeys("fileImage", parseFile);
      } catch (e) {
        print(e);
        final snackBar = SnackBar(
          content: Text(
            "Error ! Please try again.",
            style: kInterText,
          ),
          elevation: 20.0,
          backgroundColor: Colors.cyan,
        );
        ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
        return e;
      }
    } else {
      // User canceled the picker
    }
  }
}
