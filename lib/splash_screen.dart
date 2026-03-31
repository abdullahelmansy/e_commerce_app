import 'package:e_commerce_app/core/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/auth/presentation/screens/auth_screen.dart';
import 'features/auth/presentation/screens/onboarding_screen.dart';
import 'features/home/presentation/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //Single animation controller for a subtle fade-in effect, minimal entrance
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleUpAnimation;
  late Animation<Offset> _slideUpAnimation;

  //Replace these mock values with actual app state logic
  final bool isLoggedIn = false; // Simulate user login state
  final bool hasCompletedOnboarding = false; // Simulate onboarding completion

  @override
  void initState() {
    super.initState();
    //initalize the animation controller and animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scaleUpAnimation = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slideUpAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    //Start the animation
    _controller.forward();

    //Navigate to the appropriate screen after a delay
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        Widget nextScreen;
        if (!hasCompletedOnboarding) {
          nextScreen =
              const OnboardingScreen(); // Replace with actual onboarding screen
        } else if (!isLoggedIn) {
          nextScreen = const AuthScreen(); // Replace with actual auth screen
        } else {
          nextScreen = const MainScreen(); // Replace with actual main screen
        }
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  //Fade transition for the next screen
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, _) {
            return FadeTransition(
              opacity: _fadeInAnimation,
              child: SlideTransition(
                position: _slideUpAnimation,
                child: ScaleTransition(
                  scale: _scaleUpAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppConstants.primaryColor.withValues(alpha: 0.1),
                              AppConstants.primaryColor.withValues(alpha: 0.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: 40,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28),
                      //Brand name with a subtle letter spacing and a slightly heavier font weight for a modern look
                      Text(
                        'ShopEase',
                        style: GoogleFonts.outfit(
                          fontSize: 28,
                          color: Colors.black87,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      //tagline with a subtle letter spacing and a slightly heavier font weight for a modern look
                      Text(
                        'Your one-stop shop for all your needs',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 28),
                      //minimalistic loading indicator with a subtle animation to indicate progress without being distracting
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppConstants.primaryColor.withValues(alpha: 0.8),
                          ),
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
    );
  }
}
