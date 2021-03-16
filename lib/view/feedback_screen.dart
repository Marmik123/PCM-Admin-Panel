import 'package:flutter/material.dart';
import 'package:get/get.dart' hide length;
import 'package:pcm_admin/app_config.dart';
import 'package:pcm_admin/controller/feedback_controller.dart';
import 'package:pcm_admin/widgets/circular_loader.dart';

class ViewFeedBack extends StatelessWidget {
  FeedBackController fbCtrl = Get.put(FeedBackController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => fbCtrl.isLoading.value
                    ? Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: buildLoader(),
                      )
                    : (fbCtrl.fbList()?.isNotEmpty ?? false)
                        ? DataTable(
                            sortAscending: true,
                            columns: [
                              DataColumn(
                                label: Flexible(
                                  child: FittedBox(
                                    child: SelectableText(
                                      "Sr No.",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: FittedBox(
                                    child: SelectableText(
                                      "User Name",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: FittedBox(
                                    child: SelectableText(
                                      "Feedback Subject",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: FittedBox(
                                    child: SelectableText(
                                      "Feedback Description",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: FittedBox(
                                    child: SelectableText(
                                      "Actions",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate((fbCtrl.fbList()?.length ?? 0),
                                (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    SelectableText(
                                      "${index + 1}",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: theme.unselectedWidgetColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    FittedBox(
                                      child: SelectableText(
                                        fbCtrl.fbList()[index]['userData']
                                                ['username'] ??
                                            "-",
                                        style: kInterText.copyWith(
                                          fontSize: 10,
                                          color: theme.unselectedWidgetColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    FittedBox(
                                      child: SelectableText(
                                        fbCtrl.fbList()[index]['subject'] ??
                                            "-",
                                        style: kInterText.copyWith(
                                          fontSize: 10,
                                          color: theme.unselectedWidgetColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    FittedBox(
                                      child: SelectableText(
                                        fbCtrl.fbList()[index]['message'] ??
                                            "-",
                                        style: kInterText.copyWith(
                                          fontSize: 10,
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
                                            tooltip: "Delete feedback",
                                            iconSize: 10,
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title:
                                                    "Are you sure you want to delete this feedback?",
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
                                                          fbCtrl.deleteFeedBack(
                                                              fbCtrl.fbList()[
                                                                  index]);
                                                          fbCtrl
                                                              .fbList()
                                                              .removeAt(index);
                                                          Get.back();
                                                        },
                                                        child: SelectableText(
                                                          'Yes',
                                                          style: kInterText
                                                              .copyWith(
                                                            color:
                                                                theme.hintColor,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 5,
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
                                                          style: kInterText
                                                              .copyWith(
                                                            color:
                                                                theme.hintColor,
                                                            fontSize: 10,
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
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }))
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
