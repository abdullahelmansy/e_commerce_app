import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableOutlinedBotton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final Color? borderColor;
  final Color? textColor;
  final double borderRadius;
  const ReusableOutlinedBotton({
    super.key,
    required this.title,
    required this.onTap,
     this.isLoading=false,
    this.borderColor,
    this.textColor,
     this.borderRadius= AppConstants.defaultBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.grey[300]!),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              )
            : Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppConstants.primaryColor,
              ),)
          )
    );
  }
}
