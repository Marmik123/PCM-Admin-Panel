import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcm_admin/app_config.dart';
import 'package:pcm_admin/controller/advertise_controller.dart';
import 'package:pcm_admin/widgets/circular_loader.dart';
import 'package:pcm_admin/widgets/form_screen.dart';

class ManageAdvertise extends StatelessWidget {
  ManageAdvertiseController adCtrl = Get.put(ManageAdvertiseController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          button(
              buttonColor: theme.buttonColor,
              txtSize: 15,
              txtColor: theme.primaryColorDark,
              buttonTxt: "Add New",
              onTap: () {
                Get.defaultDialog(
                  confirm: adCtrl.isLoading.value
                      ? Container(
                          height: 30,
                          width: 30,
                          child: buildLoader(),
                        )
                      : button(
                          onTap: () {
                            if (adCtrl.formKey.currentState.validate()) {
                              adCtrl.registerAd();
                            } else
                              return null;
                          },
                          buttonTxt: "Save",
                          buttonColor: theme.buttonColor,
                          txtColor: theme.primaryColorDark,
                          txtSize: 8,
                        ),
                  title: "Enter Details",
                  content: FormDialog(
                    count: adCtrl.textFieldCount,
                    labelText: ["Enter Ad Name", "Enter Ad Description"].obs,
                  ),
                );
              }),
          SizedBox(
            height: 50,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => adCtrl.isLoading.value
                    ? Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: buildLoader(),
                      )
                    : (adCtrl.adsData()?.isNotEmpty ?? false)
                        ? DataTable(
                            columns: [
                              DataColumn(
                                label: Flexible(
                                  child: SelectableText(
                                    "Sr No.",
                                    style: kInterText.copyWith(
                                      fontSize: 8,
                                      color: theme.accentColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: SelectableText(
                                    "Advertise Name",
                                    style: kInterText.copyWith(
                                      fontSize: 8,
                                      color: theme.accentColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: SelectableText(
                                    "Description",
                                    style: kInterText.copyWith(
                                      fontSize: 8,
                                      color: theme.accentColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: SelectableText(
                                    "Actions",
                                    style: kInterText.copyWith(
                                      fontSize: 8,
                                      color: theme.accentColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(
                                adCtrl.adsData.isNotEmpty
                                    ? adCtrl.adsData?.length
                                    : null, (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    SelectableText(
                                      "${index + 1}",
                                      style: kInterText.copyWith(
                                        fontSize: 8,
                                        color: theme.unselectedWidgetColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    FittedBox(
                                      child: SelectableText(
                                        adCtrl.adsData[index]['adName'] ?? "-",
                                        style: kInterText.copyWith(
                                          fontSize: 8,
                                          color: theme.unselectedWidgetColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    FittedBox(
                                      child: SelectableText(
                                        adCtrl.adsData[index]
                                                ['adDescription'] ??
                                            "-",
                                        style: kInterText.copyWith(
                                          fontSize: 8,
                                          color: theme.unselectedWidgetColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            tooltip: "Edit Ad",
                                            onPressed: () {
                                              Get.defaultDialog(
                                                confirm: adCtrl.isLoading.value
                                                    ? Container(
                                                        height: 30,
                                                        width: 30,
                                                        child: buildLoader(),
                                                      )
                                                    : button(
                                                        onTap: () {
                                                          if (adCtrl.formKey
                                                              .currentState
                                                              .validate()) {
                                                            adCtrl.editAd(
                                                                adCtrl.adsData[
                                                                    index]);
                                                            Get.back();
                                                          } else
                                                            return null;
                                                        },
                                                        buttonTxt: "Save",
                                                        buttonColor:
                                                            theme.buttonColor,
                                                        txtColor: theme
                                                            .primaryColorDark,
                                                        txtSize: 8,
                                                      ),
                                                title: "Edit Details",
                                                content: FormDialog(
                                                  labelText: [
                                                    "Enter Ad Name",
                                                    "Enter Ad Description"
                                                  ].obs,
                                                ),
                                              );
                                            },
                                            icon: Icon(Icons.edit_outlined),
                                            iconSize: 8,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          tooltip: "Delete Ad",
                                          onPressed: () {
                                            Get.defaultDialog(
                                              radius: 25,
                                              title:
                                                  "Are you sure you want to delete this ad?",
                                              titleStyle: kInterText.copyWith(
                                                color: theme.accentColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              content: Column(
                                                children: [
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(theme
                                                                      .primaryColor)),
                                                      onPressed: () {
                                                        adCtrl.deleteAd(adCtrl
                                                            .adsData[index]);
                                                        adCtrl.adsData
                                                            .removeAt(index);
                                                        Get.back();
                                                      },
                                                      child: SelectableText(
                                                        'Yes',
                                                        style:
                                                            kInterText.copyWith(
                                                          color:
                                                              theme.hintColor,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(theme
                                                                      .primaryColor)),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: SelectableText(
                                                        'No',
                                                        style:
                                                            kInterText.copyWith(
                                                          color:
                                                              theme.hintColor,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          iconSize: 8,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )
                        : Center(
                            child: SelectableText(
                            "No data to display",
                            style: kInterText.copyWith(
                                fontSize: 25, color: theme.accentColor),
                          )),
              ))
        ],
      ),
    );
  }
}
