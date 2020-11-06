import 'package:flutter/material.dart';

import '../theme.dart';

class DeliveryBtn extends StatelessWidget {
  final String text;
  final Function onTap;
  final double paddingText;
  final double paddingBtn;
  

  const DeliveryBtn({Key key, this.text, this.onTap, this.paddingText, this.paddingBtn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(paddingBtn),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: paddingText),
                child: Center(
                    child: Text(
                  this.text,
                  style: TextStyle(color: DeliveryColors.white),
                )),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      DeliveryColors.purple,
                      DeliveryColors.green,
                    ]),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            onTap: this.onTap
          );
  }
}