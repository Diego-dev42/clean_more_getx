import 'package:clean_mas_getx/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/routes/delivery_routes.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatelessWidget {


  final controller = Get.find<HomeController>();

  Future<void> logout () async{
    await controller.logOut();
    Get.offAllNamed(DeliveryRoutes.login);
  }
  void onThemeUpdated(bool isDark){
    controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user.value;
      return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: user.image != null ? Column(
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Column(
            children: [
              const SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    shape:  BoxShape.circle,
                    color: DeliveryColors.green),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(radius: 50,
                    backgroundImage: AssetImage(user.image),),
                  )
              ),
              const SizedBox(height: 10,),
              Text(user.name,style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),)
            ],

          )
          ),
          Expanded( flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('personal information',
                            style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25,),
                          Text(user.username ),
                          Obx(()=>
                            SwitchListTile(value: controller.darkTheme.value,
                                title: Text('DarkMode'),
                                onChanged: onThemeUpdated,
                              activeColor: DeliveryColors.purple,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Center(child:
                RaisedButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: DeliveryColors.purple,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Cerrar Sesion', style: TextStyle(color:  DeliveryColors.white),),
                    ),
                    onPressed:logout
                ))
              ],
            )
          )
        ],
      ): const SizedBox.shrink(),
    );
    },
    );
  }
}
