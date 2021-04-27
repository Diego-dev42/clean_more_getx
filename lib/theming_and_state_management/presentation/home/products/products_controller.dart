
import 'package:clean_mas_getx/theming_and_state_management/domain/model/products.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({this.apiRepositoryInterface});
  RxList<Drink> productList=<Drink>[].obs;
  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    final result = await apiRepositoryInterface.getProducts();
    productList.value = result;
  }
}