import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcm_admin/app_config.dart';

class ManageOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                text: "Ongoing Orders",
              ),
              Tab(
                text: "Past Orders",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(
                      sortAscending: true,
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: FittedBox(
                              child: SelectableText(
                                "Sr No.",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                              fit: BoxFit.scaleDown,
                              child: SelectableText(
                                "Order Description",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                                "Order Date",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                                " Assign Delivery boy",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                                "Select Ad",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              SelectableText(
                                "1",
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
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
                                  " Description about order",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                  "Date of order",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: kInterText.copyWith(
                                    fontSize: 10,
                                    color: theme.unselectedWidgetColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(FittedBox(
                              child: IconButton(
                                iconSize: 20,
                                onPressed: () {},
                                color: theme.unselectedWidgetColor,
                                icon: Icon(Icons.add),
                              ),
                            )),
                            DataCell(FittedBox(
                              child: IconButton(
                                iconSize: 20,
                                onPressed: () {},
                                color: theme.unselectedWidgetColor,
                                icon: Icon(Icons.add),
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: DataTable(
                        sortAscending: true,
                        columns: [
                          DataColumn(
                            label: Flexible(
                              child: FittedBox(
                                child: SelectableText(
                                  "Sr No.",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                  "Order Description",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                  "Order Date",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                  " Assigned Delivery boy",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                  "Selected Ad",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                SelectableText(
                                  "1",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
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
                                    " Description about order",
                                    toolbarOptions: ToolbarOptions(
                                        copy: true,
                                        selectAll: true,
                                        cut: false,
                                        paste: false),
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
                                    "Date of order",
                                    toolbarOptions: ToolbarOptions(
                                        copy: true,
                                        selectAll: true,
                                        cut: false,
                                        paste: false),
                                    style: kInterText.copyWith(
                                      fontSize: 10,
                                      color: theme.unselectedWidgetColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(FittedBox(
                                child: SelectableText(
                                  "Delivery boy name",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: theme.unselectedWidgetColor,
                                  ),
                                ),
                              )),
                              DataCell(FittedBox(
                                child: SelectableText(
                                  " Ad name",
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: theme.unselectedWidgetColor,
                                  ),
                                ),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
