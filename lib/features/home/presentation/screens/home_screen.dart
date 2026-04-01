import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/home/data/dummy_data.dart';
import 'package:e_commerce_app/features/home/domain/entities/product.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/animated_list_item.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_card_item.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/featured_items.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/header_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/special_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onNavigateToTab;
  const HomeScreen({super.key, required this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                bottom: AppConstants.defaultPadding,
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    onCartTap: () {
                      onNavigateToTab(1); //index 1 is cart screen
                    },
                  ),
                  SizedBox(height: 16),
                  CustomSearchBar(),
                  SizedBox(height: 16),
                  _buildCategoryFilter(context),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: FeaturedItems()),
          SliverToBoxAdapter(child: SpecialOfferWidget()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //navigate to all products screen
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
          ),
          _buildStaticProduct(),
        ],
      ),
    );
  }

  Widget _buildStaticProduct() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: dummyData.length, (
          context,
          index,
        ) {
          final product = dummyData[index];
          return AnimatedListItem(
            index: index,
            isVertical: false,
            child: CustomCardItem(product: product,onTap: () {
              //navigate to product details
            },),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    final categories = ['All', 'Electronics', 'Furniture', 'Fashion', 'Kids'];
    final selectedCategory = 'All';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(bottom: 20),
          child: Text(
            'Categories',
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              final isSelected = category == selectedCategory;
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    //navigate to category products page
                  },
                  child: _categoryButton(category, isSelected),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _categoryButton(String label, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppConstants.primaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
