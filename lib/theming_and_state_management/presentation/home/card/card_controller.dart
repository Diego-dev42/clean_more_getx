import 'package:clean_mas_getx/theming_and_state_management/domain/model/product_card.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/model/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  RxList<ProductCart> cardList=<ProductCart>[].obs;
  RxInt totalItems =0.obs;
  RxDouble totalPrice=0.0.obs;

  void add(Drink product){
    final temp= List<ProductCart>.from(cardList.value);
    bool found = false;
    for (ProductCart p in temp){
     if(p.product.name == product.name){
       p.quantity += 1;
       found = true;
       break;
     }
    }
    if (!found){
      temp.add(ProductCart(product: product));
    }
    cardList.value = List<ProductCart>.from(temp);
    calculateTotals(temp);

  }
  void increment(ProductCart productCart){
    productCart.quantity += 1;
    cardList.value = List<ProductCart>.from(cardList.value);
    calculateTotals(cardList.value);
  }

  void decrement(ProductCart productCart){
    if(productCart.quantity>1){
      productCart.quantity -= 1;
      cardList.value = List<ProductCart>.from(cardList.value);
      calculateTotals(cardList.value);
    }

  }
  void calculateTotals(List<ProductCart> temp){
    final total = temp.fold(0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total);

    final totalCost = temp.fold(0.0, (previousValue, element) => (element.quantity* element.product.price)+previousValue);
    totalPrice(totalCost);
  }
  void deleteProduct(ProductCart productCart){
    cardList.remove(productCart);
    calculateTotals(cardList.value);


  }


}