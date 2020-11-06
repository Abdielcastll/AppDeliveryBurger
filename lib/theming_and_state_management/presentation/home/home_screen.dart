import 'package:animate_do/animate_do.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/home/products/products_screen.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';

import 'cart/cart_controller.dart';
import 'cart/cart_screen.dart';
import 'profile/profile_screen.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Obx(
            () => IndexedStack(
              index: controller.currentIndex.value,
              children: [
                ProductsScreen(),
                CartScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          _curvedNavigationBar(context),
        ],
      ),
    );
  }

  Widget _curvedNavigationBar(BuildContext context) {
    return CurvedNavigationBar(
      items: [
        SvgPicture.asset(
          'assets/svg/008-shop.svg',
          width: 30.0,
          color: Theme.of(context).textTheme.caption.color,
        ),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/002-shopping_cart.svg',
              width: 30.0,
              color: Theme.of(context).textTheme.caption.color,
            ),
            Positioned(
              right: -0,
              child: GetX<CartController>(
                init: CartController(),
                builder: (_) => _.cartList.isEmpty
                    ? Container()
                    : FadeInDown(
                      child: CircleAvatar(
                          radius: 7.0,
                          backgroundColor: DeliveryColors.green,
                          child: Text(
                            _.totalItems.value.toString(),
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ),
              ),
            )
          ],
        ),
        SvgPicture.asset(
          'assets/svg/avatar.svg',
          width: 30.0,
          color: Theme.of(context).textTheme.caption.color,
        ),
      ],
      index: controller.currentIndex.value,
      backgroundColor: Colors.transparent,
      color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      onTap: (value) => controller.currentIndex(value),
      buttonBackgroundColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      height: 50.0,
    );
  }
}
