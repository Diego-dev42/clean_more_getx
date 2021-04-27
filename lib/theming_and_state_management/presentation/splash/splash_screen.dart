import 'package:clean_mas_getx/theming_and_state_management/presentation/login/login_screen.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends GetWidget<SplashController> {
  final splashController=Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/images/menu1.png'),
              ),
            ),
            const SizedBox(height: 10,),
            Text('App',
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
              color: DeliveryColors.white),),
          ],
        ),
      ),
    );
  }
}
