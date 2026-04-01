import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/home/domain/entities/product.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedItems extends StatelessWidget {
  const FeaturedItems({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredItems = [
      Product(
        id: '1',
        name: 'Hoodie',
        category: 'Clothes',
        price: 120.00,
        description: 'Cool hoodie for cool people.',
        imageUrl: 'assets/images/hoodie.png',
        images: [
          'assets/images/hoodie.png',
          'assets/images/hoodie_2.png',
          'assets/images/hoodie_3.png',
        ],
        colors: ['#FF5733', '#33CFFF', '#FFC300'],
        isFavorite: false,
        specialOfferIds: ['order1'],
      ),
      Product(
        id: '2',
        name: 'Jordan Shoes',
        category: 'Shoes',
        price: 200.00,
        description: 'Cool shoes for cool people.',
        imageUrl: 'assets/images/jordan.png',
        images: [
          'assets/images/jordan.png',
          'assets/images/jordan_2.png',
          'assets/images/jordan_3.png',
        ],
        colors: ['#A0522D', '#CD853F', '#D2B48C'],
        isFavorite: false,
        specialOfferIds: ['order3'],
      ),
      Product(
        id: '3',
        name: 'Stylish Sofa',
        category: 'Sofas',
        price: 350.00,
        description:
            'A stylish sofa that adds a touch of elegance to your home.',
        imageUrl: 'assets/images/5.png',
        images: [
          'assets/images/5.png',
          'assets/images/4.png',
          'assets/images/3.png',
        ],
        colors: ['#8E44AD', '#3498DB', '#2ECC71'],
        isFavorite: false,
        specialOfferIds: ['order2'],
      ),
      Product(
        id: '4',
        name: 'Adidas Shoes',
        category: 'Shoes',
        price: 500.00,
        description: 'A sporty shoe for sporty people.',
        imageUrl: 'assets/images/adidas_shoe.png',
        images: [
          'assets/images/adidas_shoe.png',
          'assets/images/adidas_shoe.png',
          'assets/images/adidas_shoe.png',
        ],
        colors: ['#1ABC9C', '#F1C40F', '#E67E22'],
        isFavorite: false,
        specialOfferIds: ['order4'],
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Items',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //navigate to feature item screen
                },
                child: Text(
                  'View All',
                  style: GoogleFonts.outfit(
                    color: AppConstants.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: featuredItems.length,
            itemBuilder: (context, index) {
              final item = featuredItems[index];
              return Container(
                margin: EdgeInsets.only(right: 16,left: index==0?0:10),
                child: CustomCardItem(product: item,onTap: () {
                  //navigate to product
                },),
              );
            },
          ),
        ),
      ],
    );
  }
}
