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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          ' V \n A \n P \n E  \n Z \n O \n N \n E',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 68,
                            color: Colors.black87,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                          ),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/animations/Smoke Anim.json'),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.12),
                          child: const MyText(
                            text: 'Elevate Your Cloud Game...',
                            fontSize: 58,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: MyText(
                  text: 'Swipe Right To Start Vaping...',
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
