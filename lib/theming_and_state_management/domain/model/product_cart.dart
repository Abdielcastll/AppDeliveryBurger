import 'package:delivery_app/theming_and_state_management/domain/model/products.dart';

class ProductCart {
  final Products product;
  int quantity;

  ProductCart({this.product, this.quantity = 1});
}