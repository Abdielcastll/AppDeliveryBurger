import 'package:delivery_app/theming_and_state_management/domain/model/product_cart.dart';
import 'package:delivery_app/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app/theming_and_state_management/presentation/widgets/delivery_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
        ),
      ),
      body: GetX<CartController>(
        init: CartController(),
        builder: (controller) => controller.totalItems.value == 0
            ? _EmpyCartWidget()
            : _FullCartWidget(),
      ),
    );
  }
}

class _FullCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _totalStyle = Theme.of(context)
        .textTheme
        .caption
        .copyWith(fontSize: 23.0, fontWeight: FontWeight.bold);
    final TextStyle _subTotalStyle =
        Theme.of(context).textTheme.caption.copyWith(
              fontSize: 16.0,
            );
    return GetX<CartController>(
      builder: (controller) => Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 200.0,
                  itemCount: controller.cartList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return _ProductCart(
                      product: controller.cartList[i],
                      onDecrement: () {
                        controller.decrement(controller.cartList[i]);
                      },
                      onIncrement: () {
                        controller.increment(controller.cartList[i]);
                      },
                      onDelete: () {
                        controller.deleteProduct(controller.cartList[i]);
                      },
                    );
                  },
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                        spreadRadius: 0.1)
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                  color: Theme.of(context).accentColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Subtotal:',
                          style: _subTotalStyle,
                        ),
                        Obx(
                          () => Text(
                            '\$${controller.totalPrice}',
                            style: _subTotalStyle,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Delivery:',
                          style: _subTotalStyle,
                        ),
                        Text(
                          'FREE',
                          style: _subTotalStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total:',
                          style: _totalStyle,
                        ),
                        GetX<CartController>(
                          init: CartController(),
                          builder: (controller) => Text(
                            '\$${controller.totalPrice} USD',
                            style: _totalStyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    DeliveryBtn(
                      text: 'BUY',
                      paddingBtn: 0,
                      paddingText: 10.0,
                    )
                  ],
                ),
              )),
          Spacer()
        ],
      ),
    );
  }
}

class _ProductCart extends StatelessWidget {
  final ProductCart product;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _ProductCart(
      {Key key,
      this.product,
      this.onDelete,
      this.onIncrement,
      this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
      child: Stack(
        children: [
          Card(
            elevation: 2.0,
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                      backgroundColor: DeliveryColors.dark,
                      radius: 52.0,
                      child: Image(
                        image: AssetImage(product.product.image),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          product.product.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          product.product.description,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: DeliveryColors.white,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_outlined,
                                  color: DeliveryColors.purple,
                                ),
                                onTap: this.onDecrement,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(product.quantity.toString()),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: DeliveryColors.purple,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: DeliveryColors.white,
                                ),
                                onTap: this.onIncrement,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '\$${product.product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: DeliveryColors.green,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: DeliveryColors.pink,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: DeliveryColors.white,
                ),
                onPressed: this.onDelete,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _EmpyCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: SvgPicture.asset(
              'assets/svg/003-shopping_basket.svg',
              width: 150.0,
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          'There are no products',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 10.0,
        ),
        /* GetBuilder<HomeController>(
          builder: (controller) {
            return MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textColor: DeliveryColors.white,
              color: DeliveryColors.purple,
              child: Text('Go shopping'),
              onPressed: () => controller.currentIndex(0),
            );
          },
        ),*/
      ],
    );
  }
}
