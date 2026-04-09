import 'package:flutter/material.dart';

class AppSize {
  AppSize._();

  /// Method to get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Method to check if the device is a tablet
  static bool isTablet(BuildContext context) {
    final double screenWidth = getScreenWidth(context);
    // Consider devices with width >= 600dp as tablets
    return screenWidth >= 600;
  }

  /// Scaling factor based on device width and type
  static double scaleSize(BuildContext context, double baseSize) {
    final double screenWidth = getScreenWidth(context);
    // Base width for phones (e.g., iPhone 11) and tablets (e.g., iPad)
    const double phoneBaseWidth = 375.0;
    const double tabletBaseWidth = 600.0;
    // Apply a multiplier for tablets to avoid overly large scaling
    const double tabletScaleFactor = 0.9;

    if (isTablet(context)) {
      return (screenWidth / tabletBaseWidth) * baseSize * tabletScaleFactor;
    }
    return (screenWidth / phoneBaseWidth) * baseSize;
  }

  /// Amount to boost fonts on tablets
  static const double _tabletFontBoost = 1.15;

  /// Helper: apply tablet font boost if necessary
  static double _fontSize(BuildContext context, double base) {
    final size = scaleSize(context, base);
    return isTablet(context) ? size * _tabletFontBoost : size;
  }

  /// Padding and Margin sizes
  static double extraSmallPadding(BuildContext context) => scaleSize(context, 4.0);
  static double smallPadding(BuildContext context) => scaleSize(context, 8.0);
  static double mediumPadding(BuildContext context) => scaleSize(context, 16.0);
  static double largePadding(BuildContext context) => scaleSize(context, 24.0);
  static double extraLargePadding(BuildContext context) => scaleSize(context, 32.0);

  /// SizeBox sizes
  static double extraSmall(BuildContext context) => scaleSize(context, 4.0);
  static double small(BuildContext context) => scaleSize(context, 8.0);
  static double medium(BuildContext context) => scaleSize(context, 16.0);
  static double large(BuildContext context) => scaleSize(context, 24.0);
  static double extraLarge(BuildContext context) => scaleSize(context, 32.0);

  /// Icon sizes
  static double iconSizeExtraSmall(BuildContext context) => scaleSize(context, 12.0);
  static double iconSizeSmall(BuildContext context) => scaleSize(context, 16.0);
  static double iconSizeMedium(BuildContext context) => scaleSize(context, 24.0);
  static double iconSizeLarge(BuildContext context) => scaleSize(context, 32.0);

  /// Font sizes (boosted slightly on tablets)
  static double fontSizeExtraSmall(BuildContext context) => _fontSize(context, 12.0);
  static double fontSizeSmall(BuildContext context) => _fontSize(context, 14.0);
  static double fontSizeMedium(BuildContext context) => _fontSize(context, 16.0);
  static double   fontSizeLarge(BuildContext context) => _fontSize(context, 18.0);
  static double fontSizeExtraLarge(BuildContext context) => _fontSize(context, 23.0);

  /// Button sizes
  static double buttonRadius(BuildContext context) => scaleSize(context, 12.0);
  static double buttonWidth(BuildContext context) => scaleSize(context, 120.0);
  static double buttonHeight(BuildContext context) => scaleSize(context, 48.0);
  static double buttonElevation(BuildContext context) => scaleSize(context, 4.0);

  /// App bar height
  static double appBarHeight(BuildContext context) => scaleSize(context, 56.0);

  /// Image sizes
  static double imageThumbSize(BuildContext context) => scaleSize(context, 80.0);

  /// Default spacing
  static double defaultSpacing(BuildContext context) => scaleSize(context, 24.0);
  static double spaceBtwItems(BuildContext context) => scaleSize(context, 16.0);
  static double spaceBtwSections(BuildContext context) => scaleSize(context, 32.0);

  /// Border radius
  static double borderRadiusSmall(BuildContext context) => scaleSize(context, 8.0);
  static double borderRadiusMedium(BuildContext context) => scaleSize(context, 16.0);
  static double borderRadiusLarge(BuildContext context) => scaleSize(context, 32.0);

  /// Card settings
  static double cardElevation(BuildContext context) => scaleSize(context, 2.0);
  static double cardRadiusExtraSmall(BuildContext context) => scaleSize(context, 6.0);
  static double cardRadiusSmall(BuildContext context) => scaleSize(context, 10.0);
  static double cardRadiusMedium(BuildContext context) => scaleSize(context, 12.0);
  static double cardRadiusLarge(BuildContext context) => scaleSize(context, 16.0);

  /// Divider thickness
  static double dividerHeight(BuildContext context) => scaleSize(context, 1.0);

  /// Input fields
  static double inputFieldRadius(BuildContext context) => scaleSize(context, 8.0);
  static double spaceBtwInputField(BuildContext context) => scaleSize(context, 16.0);

  /// Carousel height
  static double carouselHeight(BuildContext context) => scaleSize(context, 200.0);

  /// Loading indicator size
  static double loadingIndicatorSize(BuildContext context) => scaleSize(context, 36.0);

  /// Grid spacing
  static double gridViewSpacing(BuildContext context) => scaleSize(context, 16.0);
}
