import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcm_admin/app_config.dart';
import 'package:pcm_admin/controller/users_controller.dart';
import 'package:pcm_admin/widgets/circular_loader.dart';
import 'package:pcm_admin/widgets/default_dialog.dart';
import 'package:pcm_admin/widgets/form_screen.dart';

class SalesPerson extends StatelessWidget {
  UserController userCtrl = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          button(
              buttonColor: theme.buttonColor,
              txtSize: 15,
              txtColor: theme.primaryColorDark,
              buttonTxt: "Add New",
              onTap: () {
                displayDialog(
                  context,
                  userCtrl,
                );
              }),
          SizedBox(
            height: 50,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Obx(() => userCtrl.isLoading.value
                  ? Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      child: buildLoader(),
                    )
                  : FittedBox(
                      child: (userCtrl.distriInfo()?.isNotEmpty ?? false)
                          ? DataTable(
                              sortAscending: true,
                              columns: [
                                DataColumn(
                                  label: Expanded(
                                    child: SelectableText(
                                      "Sr No.",
                                      style: kInterText.copyWith(
                                        fontSize: 15,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Full Name",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: SelectableText(
                                      "Role",
                                      style: kInterText.copyWith(
                                        fontSize: 15,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Address",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: SelectableText(
                                      "Document",
                                      maxLines: 1,
                                      style: kInterText.copyWith(
                                        fontSize: 15,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Mobile Number",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Shop Name",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Shop Location",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: FittedBox(
                                      child: SelectableText(
                                        "Shop Photo",
                                        style: kInterText.copyWith(
                                          fontSize: 15,
                                          color: theme.accentColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: SelectableText(
                                      "isActive",
                                      maxLines: 1,
                                      style: kInterText.copyWith(
                                        fontSize: 15,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: FittedBox(
                                    child: SelectableText(
                                      "Actions",
                                      style: kInterText.copyWith(
                                        fontSize: 15,
                                        color: theme.accentColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(
                                  userCtrl.distriInfo()?.length,
                                  (index) => DataRow(
                                        cells: [
                                          DataCell(
                                            SelectableText(
                                              "${index + 1}",
                                              style: kInterText.copyWith(
                                                fontSize: 12,
                                                color:
                                                    theme.unselectedWidgetColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                userCtrl.distriInfo[index]
                                                        ['name'] ??
                                                    "-",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                userCtrl.distriInfo[index]
                                                        ['role'] ??
                                                    "-",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                userCtrl.distriInfo[index]
                                                        ['address1'] ??
                                                    "-",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            SelectableText(
                                              "Document",
                                              style: kInterText.copyWith(
                                                fontSize: 12,
                                                color:
                                                    theme.unselectedWidgetColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            SelectableText(
                                              userCtrl.distriInfo[index]
                                                      ['number'] ??
                                                  "-",
                                              style: kInterText.copyWith(
                                                fontSize: 12,
                                                color:
                                                    theme.unselectedWidgetColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                "-",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                "-",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            FittedBox(
                                              child: SelectableText(
                                                "Shop Photo",
                                                style: kInterText.copyWith(
                                                  fontSize: 12,
                                                  color: theme
                                                      .unselectedWidgetColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(CupertinoSwitch(
                                            value: userCtrl.isActive.value,
                                            onChanged: (value) {
                                              userCtrl.isActive.value = value;
                                            },
                                            activeColor: theme.accentColor,
                                          )),
                                          DataCell(
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: IconButton(
                                                      tooltip: "Edit user",
                                                      onPressed: () {
                                                        Get.defaultDialog(
                                                          confirm: userCtrl
                                                                  .isLoading
                                                                  .value
                                                              ? Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child:
                                                                      buildLoader(),
                                                                )
                                                              : button(
                                                                  onTap: () {
                                                                    userCtrl.editUser(
                                                                        userCtrl
                                                                            .distriInfo[index],
                                                                        "SalesPerson");
                                                                  },
                                                                  buttonTxt:
                                                                      "Save",
                                                                  buttonColor: theme
                                                                      .buttonColor,
                                                                  txtColor: theme
                                                                      .primaryColorDark,
                                                                  txtSize: 15,
                                                                ),
                                                          title:
                                                              "Enter Details",
                                                          actions: [
                                                            button(
                                                              onTap: () {
                                                                userCtrl
                                                                    .chooseFile();
                                                              },
                                                              buttonTxt:
                                                                  "Add Photo",
                                                              buttonColor: theme
                                                                  .buttonColor,
                                                              txtColor: theme
                                                                  .primaryColorDark,
                                                              txtSize: 15,
                                                            ),
                                                          ],
                                                          content: FormDialog(
                                                            count: userCtrl
                                                                .textFieldCount,
                                                            labelText: [
                                                              "Enter Name",
                                                              "Enter Address",
                                                              "Enter Mobile Number",
                                                              "Enter Shop Name",
                                                            ].obs,
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                          Icons.edit_outlined)),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                /*IconButton(
                                                tooltip: "View User",
                                                onPressed: () {},
                                                icon: Icon(Icons.rate_review))
                                          */
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                            )
                          : Center(
                              child: SelectableText(
                              "No data to display",
                              style: kInterText.copyWith(
                                  fontSize: 25, color: theme.accentColor),
                            )),
                    ))),
        ],
      ),
    );
  }
}
