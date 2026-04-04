import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTotal extends StatelessWidget {
  final double total;
  final List<CartItem> cartItems;
  const CartTotal({super.key, required this.total, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //order summary row
            _buildSummaryRow('Subtotal', total),
            SizedBox(height: 12),
            _buildSummaryRow('Shipping', 10),
            SizedBox(height: 12),
            _buildSummaryRow('Tax', total * 0.05),
            SizedBox(height: 12),

            //total row with larger text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${(total + 10.0 + (total * 0.05)).toStringAsFixed(2)}',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    color: AppConstants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppConstants.primaryColor.withValues(alpha: 0.9),
                    AppConstants.primaryColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: Offset(0, 5)
                  ),
                
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //navigate to checkout screen
                },
                borderRadius: BorderRadius.circular(16),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                      SizedBox(width: 12,),
                      Text('Proceed to Checkout',style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(fontSize: 16, color: Colors.grey[600]),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: GoogleFonts.outfit(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
