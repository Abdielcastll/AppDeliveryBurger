import 'package:delivery_app/theming_and_state_management/presentation/main_binding.dart';
import 'package:delivery_app/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:get/route_manager.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: darkTheme,
      title: 'Material App',
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}