import 'package:delivery_app/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [DeliveryColors.green, DeliveryColors.purple])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: DeliveryColors.white,
            radius: 50.0,
            child: SvgPicture.asset(
              'assets/svg/Burger.svg',
              width: 60.0,
              color: DeliveryColors.dark,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Delivery App',
            style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold, color: DeliveryColors.white),
          )
        ],
      ),
    ));
  }
}
