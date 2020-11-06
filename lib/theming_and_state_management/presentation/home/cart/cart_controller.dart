import 'package:delivery_app/theming_and_state_management/domain/model/product_cart.dart';
import 'package:delivery_app/theming_and_state_management/domain/model/products.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Products product) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart item in temp) {
      if (item.product.name == product.name) {
        item.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    cartList.value = List<ProductCart>.from(temp);
    this.calculateTotal(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList.value = List<ProductCart>.from(cartList);
    this.calculateTotal(cartList);
  }

  void decrement(ProductCart productCart) {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
      cartList.value = List<ProductCart>.from(cartList);
      this.calculateTotal(cartList);
    }
  }

  void calculateTotal(List<ProductCart> temp) {
    
    final total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    this.totalItems(total);
    
    final subTotalPrice = temp.fold(
        0.0, (previousValue, element) => element.quantity * element.product.price + previousValue);
    this.totalPrice(subTotalPrice);
  }

  void deleteProduct(ProductCart productCart) {
    cartList.remove(productCart);
    this.calculateTotal(cartList);
  }
}
