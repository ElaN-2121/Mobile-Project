import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget buildLetter(
    String letter,
    int index,
    int totalLetters,
    double animationValue,
) {
    double step = 0.85 / totalLetters;
    double startTurn = index * step;
    double endTurn = startTurn + step;

    double letterProgress = 0.0;
    if (animationValue > startTurn) {
        letterProgress = ((animationValue - startTurn) / (endTurn-startTurn)).clamp(0.0, 1.0);
    }

    double opacity = Curves.easeOut.transform(letterProgress);

    double yOffset = (15 * (1 - Curves.easeOut.transform(letterProgress))).toDouble();

    return Opacity(
        opacity: opacity,
        child: Transform.translate(
            offset: Offset(0,yOffset),
            child:Text(
                letter,
                style: GoogleFonts.cormorantGaramond(
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 5,
                    color: Colors.white,
                ),
            ),
        ),
    );
}