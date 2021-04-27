import 'package:clean_mas_getx/theming_and_state_management/presentation/Widgets/delivery_button.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/login/login_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/routes/delivery_routes.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
const logoSize =45.0;
class LoginScreen extends GetWidget<LoginController> {
  void login() async{
    final result = await controller.login();
    if(result){
      Get.offAllNamed(DeliveryRoutes.home);
    }else{
      Get.snackbar('Error', 'Login Incorrect');
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width= size.width;
    final moreSize= 50;
    return Scaffold(
      body: Stack (children:[ Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
                children: [
                  Positioned(
                    bottom:logoSize,
                      left: -moreSize/2,
                      right: -moreSize/2,
                      height: width + moreSize,
                      child: Container(
                        decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.bottomCenter,
                              colors: deliveryGradients,
                            ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(200),
                          )
                        ),

                  ),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                  child:CircleAvatar(backgroundColor: Theme.of(context).canvasColor,
                  radius: logoSize,
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/images/menu1.png',
                          color: Theme.of(context).accentColor,))) ,),
                ],
              ),

          ),
          Expanded(
            flex: 4,
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30,),
                        Text('Login',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                            color: Theme.of(context).inputDecorationTheme.labelStyle.color,
                          ),
                        textAlign: TextAlign.center,)
                        ,
                        const SizedBox(height: 40,),
                        Text('Username', textAlign: TextAlign.start, style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).inputDecorationTheme.labelStyle.color,)
                        ),
                        TextField(controller: controller.usernameTextController,
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline,color: Theme.of(context).iconTheme.color,),
                          hintText: 'username'
                        ),),
                        const SizedBox(height: 20,),
                        Text('Password',textAlign: TextAlign.start,style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).inputDecorationTheme.labelStyle.color,)),
                        TextField(controller: controller.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline,color: Theme.of(context).iconTheme.color,),
                            hintText: 'password'
                        ),),
                      ],),
                  ))
          ),
          Padding(padding: const EdgeInsets.all(25),
          child: DeliveryButton(
            text:'Login',
            onTap: login,
          ),)
        ],
      ),
        Positioned.fill(
            child: Obx((){
              if(controller.loginState.value==LoginState.loading){
                return Container(
                    color:  Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),);
              }else{
                return const SizedBox.shrink();
              }

            }))
      ],)
    );
  }
}
