import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecialOfferWidget extends StatefulWidget {
  const SpecialOfferWidget({super.key});

  @override
  State<SpecialOfferWidget> createState() => _SpecialOfferWidgetState();
}

class _SpecialOfferWidgetState extends State<SpecialOfferWidget> {
  final _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offers = List.generate(
      3,
      (index) => {
        'id': '$index',
        'title': 'Special offer ${index + 1}',
        'discount': 30 + index * 10,
        'description': 'Save your big on modern Items',
        'image': 'assets/images/adidas_shoe.png',
      },
    );
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return GestureDetector(
                onTap: () {
                  //navigate to special offer screen
                },
                child: Container(
                  height: 210,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppConstants.primaryColor,
                                AppConstants.primaryColor.withValues(
                                  alpha: 0.8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: -40,
                          bottom: -20,
                          child: Opacity(
                            opacity: 0.85,
                            child: Image.asset(
                              offer['image'] as String,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -30,
                          bottom: -30,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.1,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -20,
                          bottom: -20,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        offer['title'] as String,
                                        style: GoogleFonts.outfit(
                                          color: AppConstants.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${offer['discount']}% OFF',
                                      style: GoogleFonts.outfit(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      offer['description']! as String,
                                      style: GoogleFonts.outfit(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            AppConstants.primaryColor,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 6,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Shop Now',
                                        style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 90),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: SmoothPageIndicator(
            controller: _pageController, // PageController
            count: offers.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
              activeDotColor: AppConstants.primaryColor,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
