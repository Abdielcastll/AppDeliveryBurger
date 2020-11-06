// import 'dart:html';

import 'package:delivery_app/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex: 2, child: _photoUser(context, controller)),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              flex: 2,
              child: _options(context, controller),
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                textColor: DeliveryColors.white,
                child: Text('Logout'),
                color: DeliveryColors.purple,
                onPressed: () async {
                  await controller.logOut();
                  Get.offAllNamed(DeliveryRoutes.splash);
                }),
            SizedBox(
              height: 90.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _photoUser(BuildContext context, HomeController controller) {
    final user = controller.user;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: DeliveryColors.green),
                ),
              ),
              Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                    child: user.image == null
                        ? Container()
                        : Image(
                            image: AssetImage(controller.user.image),
                          ),
                  ),
                  width: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned.fill(
                top: 135.0,
                bottom: 15,
                child: Container(
                  child: Icon(
                    Icons.camera_alt,
                    color: DeliveryColors.white,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DeliveryColors.purple,
                      border: Border.all(
                          color: DeliveryColors.white,
                          width: 2.0,
                          style: BorderStyle.solid)),
                ),
              )
            ],
          ),
        ),
        user.name == null
            ? Text('User')
            : Text(
                controller.user.name,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 17.0),
              ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  Widget _options(BuildContext context, HomeController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Personal Information',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Email:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            controller.user.email == null
                ? Text('Email')
                : Text(
                    controller.user.email,
                  ),
            // Spacer(),
            Row(
              children: [
                Text(
                  'Dark mode',
                ),
                Spacer(),
                Obx(
                  () => Switch(
                    activeColor: DeliveryColors.green,
                    inactiveThumbColor: DeliveryColors.purple,
                    onChanged: (value) {
                      controller.darkTheme(value);
                      controller.updateTheme(value);
                      Get.changeTheme(value? darkTheme : lightTheme);
                    },
                    value: controller.darkTheme.value,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      color: Theme.of(context).accentColor,
      margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 60.0),
    );
  }
}
