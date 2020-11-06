import 'package:meta/meta.dart';

class Products {
  final String name, description, image;
  final double price;

  Products(
      {@required this.name,
      @required this.description,
      @required this.image,
      @required this.price});
}
