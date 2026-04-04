import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_total.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/empty_cart.dart';
import 'package:e_commerce_app/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final List<CartItem> cartItems = [
    CartItem(
      product: Product(
        id: '1',
        name: 'Queen Bad',
        category: 'Furniture',
        price: 499.99,
        description: 'A stylish bad for your home.',
        imageUrl: 'assets/images/queen_bed.png',
        images: [],
        colors: [],
      ),
      quantity: 2,
      selectedColor: '#FF6F61',
    ),
    CartItem(
      product: Product(
        id: '2',
        name: 'Wooden Coffee Table',
        category: 'Living Room',
        price: 259.00,
        description: 'A handcrafted wooden coffee table for your home.',
        imageUrl: 'assets/images/coffee_table_1.png',
        images: [],
        colors: [],
      ),
      quantity: 1,
      selectedColor: '#8D6E63',
    ),
    CartItem(
      product: Product(
        id: '3',
        name: 'Ergonomic Office Chair',
        category: 'Office',
        price: 185.50,
        description:
            'A comfortable ergonomic office chair for your home office.',
        imageUrl: 'assets/images/dining_table.png',
        images: [],
        colors: [],
        specialOfferIds: [],
      ),
      quantity: 1,
      selectedColor: '#3949AB',
      discountPercentage: 15,
    ),
    CartItem(
      product: Product(
        id: '3',
        name: 'Ergonomic Office Chair',
        category: 'Office',
        price: 185.50,
        description:
            'A comfortable ergonomic office chair for your home office.',
        imageUrl: 'assets/images/dining_table.png',
        images: [],
        colors: [],
        specialOfferIds: [],
      ),
      quantity: 1,
      selectedColor: '#3949AB',
      discountPercentage: 15,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: AppConstants.defaultPadding,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Cart",
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          //show comfirmation dialog
                        },
                        icon: Icon(Icons.delete_outline, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.black87),
                      SizedBox(width: 12),
                      Text(
                        '${cartItems.length} Items',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          'Edit',
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: AppConstants.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //main contain with improved styling
          Expanded(
            child: Builder(
              builder: (context) {
                if (cartItems.isEmpty) {
                  return EmptyCart();
                }
                return Column(
                  //cart items list
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(20),
                        itemCount: cartItems.length + 1, //+1for the total cart
                        itemBuilder: (context, index) {
                          if (index < cartItems.length) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: CartItemCard(
                                cartItem: cartItems[index],
                                onUndo: (item) {},
                              ),
                            );
                          } else {
                            //cart total section
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: CartTotal(
                                total: 2999.99,
                                cartItems: cartItems,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
