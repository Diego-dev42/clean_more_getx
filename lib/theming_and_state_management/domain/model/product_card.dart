
import 'package:clean_mas_getx/theming_and_state_management/domain/model/products.dart';

class ProductCart{

  ProductCart({this.product, this.quantity = 1});

  final Drink product;
  int quantity;

}