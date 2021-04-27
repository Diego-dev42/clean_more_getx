

import 'package:clean_mas_getx/theming_and_state_management/data/datasource/api_repository_impl.dart';
import 'package:clean_mas_getx/theming_and_state_management/data/datasource/local_repository_impl.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositotyImpl());
  }

}