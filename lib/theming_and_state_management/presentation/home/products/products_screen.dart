import 'package:delivery_app/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/home/products/products_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app/theming_and_state_management/presentation/widgets/delivery_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      init: ProductsController(apiRepositoryInterface: Get.find()),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Inicio',
          ),
        ),
        body: Obx(() => controller.products.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.only(top: 20.0, bottom: 80.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: controller.products.length,
                itemBuilder: (context, i) {
                  final Products product = controller.products[i];
                  return _ItemProduct(
                    product: product,
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Products product;

  const _ItemProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CircleAvatar(
                backgroundColor: DeliveryColors.dark,
                radius: 45.0,
                child: Image(
                  image: AssetImage(product.image),
                )),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Text(
                  '\$${product.price} usd',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(
            init: CartController(),
            builder: (_) => DeliveryBtn(
              onTap: () {
                _.add(product);
              },
              paddingBtn: 10.0,
              paddingText: 8,
              text: 'Add',
            ),
          )
        ],
      ),
    );
  }
}
