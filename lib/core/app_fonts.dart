import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppFonts {
  static TextStyle sectionTitle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle menuTitle = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle profileName = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle profileSub = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static TextStyle profileInfo = GoogleFonts.poppins(
    fontSize: 13,
    color: Colors.white,
  );
}
