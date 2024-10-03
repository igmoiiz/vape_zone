import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vape_zone/components/text.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
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
                            fontSize: mediaQuery.height * 0.07,
                            color: Colors.black87,
                            fontFamily: GoogleFonts.rubikWetPaint().fontFamily,
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.10),
                          child: Text(
                            'Elevate Your Cloud Game...',
                            style: TextStyle(
                              fontSize: mediaQuery.height * 0.05,
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
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                text: 'Swipe Right To Start Vaping...',
                fontSize: mediaQuery.height * 0.02,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
