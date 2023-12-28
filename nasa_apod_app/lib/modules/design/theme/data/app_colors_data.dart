part of app_theme_data;

class AppPaletteColorsData {
  static const blackChocolate = Color(0x1919190A);
  static const brightGray = Color(0xFFEAEAEA);
  static const cultured = Color(0xFFF4F4F4);
  static const debianRed = Color(0xFFd80f58);
  static const eerieBlack = Color(0xFF191919);
  static const electricPink = Color(0xFFFE1F6F);
  static const gainsboro = Color(0xFFD9D9DC);
  static const lavenderGray = Color(0xFFC7C7CD);
  static const maroonX11 = Color(0xFFC23166);
  static const mediumTurquoise = Color(0xFF4DDCCA);
  static const nickel = Color(0xFF707075);
  static const pastelOrange = Color(0xFFFEBC43);
  static const spanishGray = Color(0xFF9E9E9E);
  static const taupeGray = Color(0xFF86868B);
  static const white = Color(0xFFffffff);

  static const MaterialColor shadeEletricPink =
      MaterialColor(_shadeEletricPink, <int, Color>{
    50: Color(0xFFFFE4EE),
    100: Color(0xFFFFBCD4),
    200: Color(0xFFFF8FB8),
    300: Color(0xFFFF629B),
    400: Color(0xFFFF4185),
    500: Color(_shadeEletricPink),
    600: Color(0xFFFF1B68),
    700: Color(0xFFFF175D),
    800: Color(0xFFFF1253),
    900: Color(0xFFFF0A41),
  });
  static const int _shadeEletricPink = 0xFFFF1F70;
}

// class AppColorsData {
//   final AppPaletteColorsData palette;
//   final Color dotsIndicatorGreyColor;
//   final Color grey;
//   final Color white;
//   final Color black;
//   final Color shadowColor;
//   final Color dividerLightGrey;
//   final Color textColorGrey;
//   final Color disabled;
//   final Color disableCard;
//   final Color dividerColor;
//   final Color appBarColor;
//   final Color separatorColor;
//   final Color darkGrey;
//   final Color appPinkCard;
//   final Color dotsAddressColor;
//   final Color dotColorGreen;
//   final Color dotColorYelow;
//   final Color primarySwatch;
//   final Color primaryDotShadow;
//   final MaterialColor primary;
//   final Color foreground;
//   final Color canvas;
//   final Color good;

//   const AppColorsData({
//     required this.palette,
//     required this.dotsIndicatorGreyColor,
//     required this.grey,
//     required this.white,
//     required this.black,
//     required this.shadowColor,
//     required this.dividerLightGrey,
//     required this.textColorGrey,
//     required this.disabled,
//     required this.disableCard,
//     required this.dividerColor,
//     required this.appBarColor,
//     required this.separatorColor,
//     required this.darkGrey,
//     required this.appPinkCard,
//     required this.dotsAddressColor,
//     required this.dotColorGreen,
//     required this.dotColorYelow,
//     required this.primarySwatch,
//     required this.primaryDotShadow,
//     required this.primary,
//     required this.foreground,
//     required this.canvas,
//     required this.good,
//   });

//   factory AppColorsData._light() => AppColorsData(
//         palette: AppPaletteColorsData(),
//         dotsIndicatorGreyColor: AppPaletteColorsData.brightGray,
//         grey: AppPaletteColorsData.spanishGray,
//         white: AppPaletteColorsData.white,
//         black: AppPaletteColorsData.eerieBlack,
//         shadowColor: AppPaletteColorsData.blackChocolate,
//         dividerLightGrey: AppPaletteColorsData.cultured,
//         textColorGrey: AppPaletteColorsData.nickel,
//         disabled: AppPaletteColorsData.lavenderGray,
//         disableCard: AppPaletteColorsData.brightGray,
//         dividerColor: AppPaletteColorsData.brightGray,
//         appBarColor: AppPaletteColorsData.cultured,
//         separatorColor: AppPaletteColorsData.gainsboro,
//         darkGrey: AppPaletteColorsData.nickel,
//         appPinkCard: AppPaletteColorsData.electricPink,
//         dotsAddressColor: AppPaletteColorsData.taupeGray,
//         dotColorGreen: AppPaletteColorsData.mediumTurquoise,
//         dotColorYelow: AppPaletteColorsData.pastelOrange,
//         primarySwatch: AppPaletteColorsData.maroonX11,
//         primaryDotShadow: AppPaletteColorsData.debianRed,
//         primary: AppPaletteColorsData.shadeEletricPink,
//         foreground: AppPaletteColorsData.white,
//         canvas: AppPaletteColorsData.white,
//         good: AppPaletteColorsData.mediumTurquoise,
//       );
// }
