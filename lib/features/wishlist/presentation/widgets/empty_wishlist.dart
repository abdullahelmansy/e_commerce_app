import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:flutter/material.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: AppConstants.titleStyle.copyWith(color: Colors.grey[600]),
          ),
          SizedBox(height: 8),
          Text(
            'Save items you like by tapping the heart icon',
            style: AppConstants.bodyStyle.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
