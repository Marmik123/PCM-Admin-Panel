import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcm_admin/controller/users_controller.dart';
import 'package:pcm_admin/view/users/client.dart';
import 'package:pcm_admin/view/users/delivery_boy.dart';
import 'package:pcm_admin/view/users/distributor.dart';
import 'package:pcm_admin/view/users/salesperson.dart';

class ManageUsers extends StatelessWidget {
  UserController userCtrl = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (value) {
              value == 0
                  ? userCtrl.loadUser(userCtrl.clientInfo)
                  : value == 1
                      ? userCtrl.loadUser(userCtrl.distInfo)
                      : value == 2
                          ? userCtrl.loadUser(userCtrl.salesInfo)
                          : value == 3
                              ? userCtrl.loadUser(userCtrl.delInfo)
                              : null;
            },
            tabs: [
              Tab(
                text: "Client",
              ),
              Tab(
                text: "Distributor",
              ),
              Tab(
                text: "SalesPerson",
              ),
              Tab(
                text: "DeliveryBoy",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Client(),
          Distributor(),
          SalesPerson(),
          DeliveryBoy(),
        ]),
      ),
    );
  }
}
