import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vape_zone/components/text.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added scrolling capability
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'V\nA\nP\nE\nZ\nO\nN\nE',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 68,
                              color: Colors.black87,
                              fontFamily:
                                  GoogleFonts.rubikWetPaint().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/animations/Smoke Anim.json'),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.12),
                            child: Text(
                              'Elevate Your Cloud Game...',
                              style: TextStyle(
                                fontSize: 58,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontFamily:
                                    GoogleFonts.rubikWetPaint().fontFamily,
                              ),
                              textAlign: TextAlign.center, // Centered text
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyText(
                  text: 'Swipe Right To Start Vaping...',
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
