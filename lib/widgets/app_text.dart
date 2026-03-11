import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme.dart';

class AppText extends StatelessWidget {

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final int? maxLines;
  final TextAlign? align;

  const AppText(
      this.text, {
        super.key,
        this.size = 14,
        this.weight = FontWeight.normal,
        this.color = AppColors.textPrimary,
        this.maxLines,
        this.align,
      });

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style:GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}