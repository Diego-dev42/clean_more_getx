import 'package:clean_mas_getx/theming_and_state_management/data/in_memory_products.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/model/products.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/Widgets/delivery_button.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/card/card_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductsScreen extends StatelessWidget {

  final controller = Get.put<ProductsController>(ProductsController(
    apiRepositoryInterface: Get.find(),
  ));
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(()=>
            controller.productList.isNotEmpty ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            childAspectRatio: 2/3),
            itemCount: controller.productList.length,
            itemBuilder: (context,index){
              final product= controller.productList[index];
              return _ItemProduct(
                  product:product,
                  onTap:(){
                    cartController.add(product);

                  });
            }
            ) : const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  _ItemProduct({Key key, this.product,this.onTap}) : super(key: key);
  final Drink product;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Image.asset(product.image)),
            Expanded(
              child: Column(children: [
                Text(product.name),
                Text('\$${product.price} Mx', style: TextStyle(
                  color:  Theme.of(context).accentColor,
                ),),
              ],),
            ),
            DeliveryButton(
              padding: const EdgeInsets.all(4),
              text:'Agregar',
              onTap: onTap,
            ),

          ],
        ),
      ),
    );
  }
}
