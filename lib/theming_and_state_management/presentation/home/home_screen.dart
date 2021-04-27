import 'package:clean_mas_getx/theming_and_state_management/presentation/home/card/card_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card/card_screen.dart';
import 'products/products_screen.dart';
import 'profile/profile_screen.dart';
class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Expanded(
          child: Obx(
              ()=>IndexedStack(
              index: controller.indexSelected.value,
              children: [
                ProductsScreen(),
                const Placeholder(),
                CartScreen(onShopping:(){
                  /*
                  setState(() {
                    currentIndex=0;
                  });*/
                  controller.indexSelected.value=0;
                }),
                const Placeholder(),
                ProfileScreen(),
              ],
            ),
          ),
        ),
        Obx(
          ()=> _DeliveryNavigationBar(index:controller.indexSelected.value, onIndexSelected: (index){
            controller.updateIndexSelected(index);
          }),
        ),
      ],
    ),
    );
  }
}
class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  _DeliveryNavigationBar({Key key, this.index,this.onIndexSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:  Theme.of(context).canvasColor,
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(child: IconButton(icon: Icon(Icons.home,
              color: index == 0 ? DeliveryColors.green : DeliveryColors.lightGrey ,
            ), onPressed: ()=>onIndexSelected(0))),

            Material(child: IconButton(icon: Icon(Icons.store,
              color: index == 1 ? DeliveryColors.green : DeliveryColors.lightGrey ,
            ), onPressed: ()=>onIndexSelected(1))),

            Material(
              child: Stack(children:[
              CircleAvatar(
                backgroundColor: DeliveryColors.purple,
                  child: IconButton(icon: Icon(Icons.shopping_basket,
                    color: index == 2 ? DeliveryColors.green : DeliveryColors.white ,
                  ), onPressed: ()=>onIndexSelected(2))),
                Positioned(
                  right: 0,
                    child: Obx(()=> cartController.totalItems.value == 0 ? const SizedBox.shrink() :
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.pinkAccent,
                        child: Text(cartController.totalItems.value.toString()),
                      ),
                    ))
                ,]),
            ),

            Material(child: IconButton(icon: Icon(Icons.favorite_border,
              color: index == 3 ? DeliveryColors.green : DeliveryColors.lightGrey ,
            ), onPressed: ()=>onIndexSelected(3))),

            Material(
              child: InkWell(
                onTap: ()=>onIndexSelected(4),
                  child: Obx (() {
                    final user=controller.user.value;
                    return user.image == null ? const SizedBox.shrink() :
                    CircleAvatar(
                      radius:  15,
                      backgroundImage: AssetImage(user.image,) );
                  }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

