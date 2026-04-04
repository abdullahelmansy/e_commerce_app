import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:e_commerce_app/features/home/domain/entities/product.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/animated_list_item.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_card_item.dart';
import 'package:e_commerce_app/features/wishlist/presentation/widgets/empty_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true; //dummy flag
    final List<Product> wishlistItems = [
      Product(
        id: '1',
        name: 'Confirt Bed',
        category: 'Furniture',
        price: 199.99,
        description: 'Stylish and ergonomic bed',
        imageUrl: 'assets/images/queen_bed.png',
        images: [],
        colors: [],
      ),
      Product(
        id: '2',
        name: 'Elegant Lamp',
        category: 'Decoration',
        price: 89.99,
        description: 'Aesthetic and functional lamp',
        imageUrl: 'assets/images/wardrobe.png',
        images: [],
        colors: [],
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: AppConstants.defaultPadding,
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wishlist',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (wishlistItems.isNotEmpty)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (!isLoggedIn) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Sign in to view your wishlist',
                          style: AppConstants.titleStyle.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Create an account to save your favorite items',
                          style: AppConstants.bodyStyle.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            //navigate to signin screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.primaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (wishlistItems.isEmpty) {
                  return EmptyWishlist();
                }
                return GridView.builder(
                  padding: EdgeInsets.all(AppConstants.defaultPadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = wishlistItems[index];
                    return AnimatedListItem(
                      index: index,
                      isVertical: false,
                      child: Hero(
                        tag: 'wishlist_${item.id}',
                        child: CustomCardItem(
                          product: item,
                          onTap: () {
                            //navigate to details screen
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
