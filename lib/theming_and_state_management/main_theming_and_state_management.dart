import 'package:clean_mas_getx/theming_and_state_management/presentation/routes/delivery_routes.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/main_binding.dart';

class MainThemingAndStateManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPage.page,
      initialBinding: MainBinding(),
    );
  }
}

