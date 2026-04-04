import 'package:e_commerce_app/features/home/domain/entities/product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String selectedColor;
  final double? discountPercentage;
  CartItem({
    required this.product,
    required this.quantity,
    required this.selectedColor,
    this.discountPercentage,
  });

  double get totalPrice {
    if (product.hasSpecialOffer && discountPercentage != null) {
      return product.getDiscountedPrice(discountPercentage!);
    } else {
      return product.price * quantity;
    }
  }

  double get unitPrice{
    if (product.hasSpecialOffer && discountPercentage != null) {
      return product.getDiscountedPrice(discountPercentage!);
    } else {
      return product.price;
    }
  }
}
