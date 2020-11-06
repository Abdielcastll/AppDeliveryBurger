import 'package:delivery_app/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({this.apiRepositoryInterface});

  RxList<Products> products = <Products>[].obs;

  @override
  void onInit() {
    this.loadProducts();
    super.onInit();
  }

  void loadProducts()async{
    final result = await apiRepositoryInterface.getProducts();
    products.value = result;
  }
}