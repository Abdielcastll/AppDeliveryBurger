// import 'dart:html';

import 'package:delivery_app/theming_and_state_management/presentation/login/login_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app/theming_and_state_management/presentation/widgets/delivery_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(DeliveryRoutes.home);
    } else {
      Get.snackbar(
        '',
        '',
        colorText: Colors.red,
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 40.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        titleText: Text(
          'ERROR',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        messageText: Text(
          'Login incorrect',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        barBlur: 30.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -25,
                        right: -25,
                        bottom: 50,
                        height: MediaQuery.of(context).size.width + 25,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [
                                    0.3,
                                    1
                                  ],
                                  colors: [
                                    DeliveryColors.green,
                                    DeliveryColors.purple,
                                  ]),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(
                                      MediaQuery.of(context).size.width))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1,
                                    offset: Offset(0, 1))
                              ]),
                          child: SvgPicture.asset(
                            'assets/svg/Burger.svg',
                            width: 60.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                controller: controller.userNameTextController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                controller: controller.passwordTextController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock,
                                        color:
                                            Theme.of(context).iconTheme.color),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color),
                                        onPressed: () {})),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              DeliveryBtn(
                paddingBtn: 40.0,
                paddingText: 20.0,
                text: 'Login',
                onTap: () {
                  this.login();
                },
              )
            ],
          ),
          Positioned.fill(
            child: Obx(() {
              if (controller.loginState.value == LoginState.loading) {
                return Container(
                  color: Colors.black54,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: DeliveryColors.green,
                    ),
                  ),
                );
              }
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
