import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';

// Helper function to get the default color
// This allows you to avoid passing context to every TextStyle function directly
// However, the TextStyle functions themselves will still need context.
// A better approach is often to define these styles within a ThemeExtension
// or provide a default context in a higher-level widget.
// For now, let's modify the functions to accept BuildContext.

// You will need to pass BuildContext to these functions
// Or wrap them in a stateful widget where you can get the context.

// Example of how you would call these:
// Text(
//   'Hello',
//   style: boldSize50Text(context), // Pass context directly
// )
// OR
// Text(
//   'Hello',
//   style: boldSize50Text(context, color: Colors.blue), // Override default
// )

// If you want to use it without passing context directly to *every* call,
// you might define a class for your text styles that takes a BuildContext
// in its constructor.

// Here's the updated version of your TextStyle functions:

// size 50
TextStyle boldSize50Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 55,
    );
TextStyle semiBoldSize48Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 48,
    );

// size 45
TextStyle mediumSize45Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 45,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
    );
TextStyle veryBoldSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w800,
    );
TextStyle extraBoldSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w800,
    );
TextStyle boldSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w700,
    );
TextStyle lightSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w300,
    );
TextStyle mediumSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
    );
TextStyle semiBoldSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w600,
    );
TextStyle normalSize40Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 40,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w400,
    );

// size 34
TextStyle normalSize34Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 34,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w400,
    );

// size 32
TextStyle boldSize32Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 32,
    );

TextStyle semiBoldSize32Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 32,
    );

TextStyle normalSize32Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 32,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w400,
    );

// size30
TextStyle mediumSize30Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
    );

// size28
TextStyle semiBoldSize28Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 28,
    );

TextStyle normalSize28Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 28,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w400,
    );

// size26
TextStyle boldSize28Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    );

TextStyle boldSize26Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w700,
      fontSize: 26,
    );

TextStyle normalSize26Text([Color? color]) => GoogleFonts.poppins(
      fontSize: 26,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w400,
    );

TextStyle mediumSize26Title([Color? color]) => GoogleFonts.poppins(
      fontSize: 26,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
    );

// size24

TextStyle boldSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );

TextStyle extraBoldSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w800,
      fontSize: 24,
    );
TextStyle veryBoldSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w800,
      fontSize: 24,
    );

TextStyle mediumSize20Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );

TextStyle mediumSize22Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
      fontSize: 22,
    );

TextStyle mediumSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    );
TextStyle semiBoldSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    );

TextStyle normalSize24Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    );

// size 22
TextStyle semiBoldSize22Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 22,
    );

TextStyle boldSize22Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 22,
    );

TextStyle normalSize22Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 22,
    );

// size20
TextStyle extraBoldSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );
TextStyle veryBoldSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );

TextStyle boldSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );
TextStyle heavySize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );

TextStyle semiBoldSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );

TextStyle lightSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w300,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );

TextStyle normalSize20Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 20,
    );

// size18
TextStyle extraBoldSize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );
TextStyle boldSize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );
TextStyle heavySize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );

TextStyle semiBoldSize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );

TextStyle mediumSize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );

TextStyle normalSize18Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 18,
    );

// size17
TextStyle boldSize17Text(
  BuildContext context, [
  Color? color,
  TextDecoration? decoration,
]) =>
    GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      fontSize: 17,
    );
TextStyle veryBoldSize18Text(
  BuildContext context, [
  Color? color,
  TextDecoration? decoration,
]) =>
    GoogleFonts.quicksand(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      fontSize: 17,
    );
TextStyle semiBoldSize17Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 17,
    );

TextStyle normalSize17Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 17,
    );

// size16
TextStyle boldSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );
TextStyle extraBoldSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );
TextStyle veryBoldSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );

TextStyle semiBoldSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );

TextStyle mediumSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );

TextStyle normalSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );

TextStyle lightSize16Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w300,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 16,
    );

// size15
TextStyle boldSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );

TextStyle semiBoldSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );
TextStyle mediumSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );

TextStyle normalSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );
TextStyle lightSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w300,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );
TextStyle extraBoldSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );
TextStyle veryBoldSize15Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 15,
    );

// size14
TextStyle extraBoldSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle boldSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle veryBoldSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle heavySize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle mediumSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle semiBoldSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle normalSize14Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 14,
    );

TextStyle lightSize14Text([Color? color]) => GoogleFonts.poppins(
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );

// size13

TextStyle mediumSize13Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 13,
    );
TextStyle boldSize13Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 13,
    );
TextStyle semiBoldSize13Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 13,
    );
TextStyle extraBoldSize13Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 13,
    );

TextStyle normalSize13Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 13,
    );

// size12
TextStyle extraBoldSize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );

TextStyle veryHeavySize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );

TextStyle boldSize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );
TextStyle heavySize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );
TextStyle semiBoldSize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );

TextStyle mediumSize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );

TextStyle normalSize12Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 12,
    );

// size11
TextStyle boldSize11Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 11,
    );
TextStyle heavySize11Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 11,
    );
TextStyle semiBoldSize11Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 11,
    );
TextStyle mediumSize11Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 11,
    );

TextStyle normalSize11Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 11,
    );

// size10
TextStyle boldSize10Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 10,
    );
TextStyle semiBoldSize10Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 10,
    );

TextStyle heavySize10Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 10,
    );

TextStyle mediumSize10Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 10,
    );
TextStyle normalSize10Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 10,
    );

// size9
TextStyle normalSize9Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 9,
    );

// size8
TextStyle normalSize8Text([Color? color]) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.lightGrey,
      height: 1.6,
      fontSize: 8,
    );
