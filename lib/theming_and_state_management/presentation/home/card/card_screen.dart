
import 'package:clean_mas_getx/theming_and_state_management/domain/model/product_card.dart';

import 'package:clean_mas_getx/theming_and_state_management/presentation/Widgets/delivery_button.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/card/card_controller.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartScreen extends GetWidget<CartController> {
  final VoidCallback onShopping;

  CartScreen({Key key, this.onShopping}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text('Cart'),
    ),
      body: Obx(() => controller.totalItems.value == 0 ? _EmptyCard(onShopping: onShopping ,) : _fullCard()),
    );
  }
}
class _ShoppingCardProduct extends StatelessWidget {
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;


  const _ShoppingCardProduct({Key key, this.productCart,this.onDelete,this.onIncrement,this.onDecrement}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(children:[Card(
        elevation: 8,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Image.asset(productCart.product.image)),
              Expanded(
                child: Column(children: [
                  Text(productCart.product.name),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: DeliveryColors.white,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: InkWell(
                          child: Icon(Icons.remove,color: DeliveryColors.purple,),
                            onTap: onDecrement),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text(productCart.quantity.toString(), style: TextStyle(
                          color:  DeliveryColors.dark,
                        ),),
                      ),
                      Container(
                        color: DeliveryColors.purple,
                        child: InkWell(
                            child: Icon(Icons.add,color: DeliveryColors.white,),
                            onTap: onIncrement),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text('\$${productCart.product.price} Mx', style: TextStyle(
                          color:  DeliveryColors.green,
                        ),),
                      ),
                    ],
                  ),

                ],),
              ),
            ],
          ),
        ),
      ),
        Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(backgroundColor: DeliveryColors.pink,
              child: Icon(Icons.delete),),
            ))
      ],)

    );
  }
}

class _fullCard extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex:3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Obx(()=>
                  ListView.builder( itemCount:  controller.cardList.length,
                      scrollDirection: Axis.horizontal,
                      itemExtent: 230,
                      itemBuilder: (context,index){
                    final product =controller.cardList[index];
                    return _ShoppingCardProduct(
                      productCart: product,
                      onDelete:(){
                        controller.deleteProduct(product);
                      },
                      onIncrement:(){
                        controller.increment(product);
                      },
                      onDecrement:(){
                        controller.decrement(product);
                      },
                    );
                  }),
                ),
              ),
            ),
        Expanded(
            flex:2,
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: const EdgeInsets.only( top: 20.0),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.stretch,
                      children: [
                        Row( mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                          Text('subtotal',style:  TextStyle( color: Theme.of(context).accentColor),),
                          Text('0.0 Mx',style:  TextStyle( color: Theme.of(context).accentColor),),
                        ],),
                        Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery',style:  TextStyle( color: Theme.of(context).accentColor),),
                            Text('Free',style:  TextStyle( color: Theme.of(context).accentColor),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',style:  TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),),
                            Obx(() {
                              final total= controller.totalPrice.value.toStringAsFixed(2);
                                return Text('\$$total Mx',style:  TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),); }),

                          ],
                        ),
                        Spacer(),
                        DeliveryButton(
                          text: 'SHopp',
                          onTap: (){},
                        )

                      ],

                    ),
                  ),

                ),
              )),

      ],
    );
  }
}

class _EmptyCard extends StatelessWidget {
  final VoidCallback onShopping;

  const _EmptyCard({Key key, this.onShopping}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.stretch,
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/menu1.png', height: 90,),
        const SizedBox(height: 20,),
        Text('no haz agregado nada al carro',textAlign:  TextAlign.center,style: TextStyle(color: Theme.of(context).accentColor),),
        const SizedBox(height: 20,),
        Center(child:
        RaisedButton(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
            color: DeliveryColors.purple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Go to shoping', style: TextStyle(color:  DeliveryColors.white),),
            ),
            onPressed: onShopping))
        
      ],
    );
  }
}
