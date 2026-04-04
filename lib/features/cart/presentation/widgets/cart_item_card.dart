import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final Function(CartItem)? onUndo;
  const CartItemCard({super.key, required this.cartItem, this.onUndo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${cartItem.product.name}_${cartItem.selectedColor}'),
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete_sweep, color: Colors.red, size: 28),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {},
      confirmDismiss: (direction) async {
        // implemant confirmation dialog if needed
        return true;
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            //product image with gradient border
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey.shade100],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(cartItem.product.imageUrl),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cartItem.product.name,
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(
                                  int.parse(
                                    cartItem.selectedColor.replaceFirst(
                                      '#',
                                      '0xff',
                                    ),
                                  ),
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Color',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      if (cartItem.product.hasSpecialOffer) ...[
                        Text(
                          '\$${cartItem.product.price.toStringAsFixed(2)}',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(),
                          child: Text(
                            '\$${cartItem.unitPrice.toStringAsFixed(2)}',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: Color(0xff4caf50),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ] else
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                          ),
                          child: Text(
                            '\$${cartItem.product.price.toStringAsFixed(2)}',
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: AppConstants.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text(
                      '\$${cartItem.totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Quantity controls with enhanced design
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.grey.shade50, Colors.grey.shade100],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildQuantityButton(context, Icons.add, () {}, true),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: Text(
                          '${cartItem.quantity}',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      _buildQuantityButton(context, Icons.remove, () {}, false),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade50, Colors.red.shade100],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Icon(Icons.delete_outline_rounded, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
    bool isAdd,
  ) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isAdd
            ? BorderRadius.vertical(top: Radius.circular(16))
            : BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: isAdd
            ? BorderRadius.vertical(top: Radius.circular(16))
            : BorderRadius.vertical(bottom: Radius.circular(16)),
        child: InkWell(
          onTap: onTap,
          borderRadius: isAdd
              ? BorderRadius.vertical(top: Radius.circular(16))
              : BorderRadius.vertical(bottom: Radius.circular(16)),
          child: Icon(
            icon,
            size: 20,
            color: isAdd ? AppConstants.primaryColor : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
