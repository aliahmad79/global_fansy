import 'package:flutter/material.dart';

class ThemePreferences {
  bool _isDark = false;

  ThemePreferences._internal();

  static ThemePreferences? _themePreferences;

  factory ThemePreferences() {
    return _themePreferences ??= ThemePreferences._internal();
  }

  final AppTheme _darkTheme = AppTheme(isDark: true);
  final AppTheme _lightTheme = AppTheme(isDark: false);

  AppTheme get appTheme => _isDark ? _darkTheme : _lightTheme;

  void dark(bool darkMode) {
    _isDark = darkMode;
  }

  ///
  ///
  /// Brightness:
  ///
  ///
  /// Brightness Light:
  ///
  /// System Brightness Light:
  static Brightness systemBrightnessLight = Brightness.light;

  ///
  /// Status Bar Icons Brightness Light:
  static Brightness statusBarIconBrightnessLight = Brightness.light;

  ///
  /// Generic Status Bar Icons Brightness Light:
  static Brightness genericStatusBarIconBrightnessLight = Brightness.light;

  ///
  ///
  /// Brightness Dark:
  ///
  /// System Brightness Dark:
  static Brightness systemBrightnessDark = Brightness.dark;

  ///
  /// Status Bar Icons Brightness Dark:
  static Brightness statusBarIconBrightnessDark = Brightness.dark;

  ///
  /// Generic Status Bar Icons Brightness Dark:
  static Brightness genericStatusBarIconBrightnessDark = Brightness.light;

  ///
  /// TextStyle Font Sizes
  ///

  ///  Font Sizes
  static double screenTitleFontSize = 28.0;
  static double bodyTextFontSize = 16.0;
  static double appBarSubTextFontSize = 16.0;
  static double nameTextFontSize = 16.0;
  static double bodyTextClickableFontSize = 16.0;
  static double buttonTextFontSize = 16.0;

  ///
  /// TextStyle FontWeights
  ///

  static FontWeight screenTitleFontWeight = FontWeight.w300;
  static FontWeight bodyClickableTextFontWeight = FontWeight.w700;
  static FontWeight nameTextFontWeight = FontWeight.w700;
  static FontWeight userNameTextFontWeight = FontWeight.w300;
  static FontWeight bodyTextFontWeight = FontWeight.w400;
  static FontWeight buttonTextFontWeight = FontWeight.w700;
  static FontWeight checkBoxTextFontWeight = FontWeight.w300;
  static FontWeight hintTextFieldTextFontWeight = FontWeight.w300;

  ///
  /// Colors
  ///

  /// Primary Color of App:
  static MaterialColor appPrimaryColor = primaryColor;

  /// Background color
  static Color backgroundColorLight = Colors.white;

  /// Master Color of App Icons:
  static Color appIconsMasterColorLight = primaryColor;

  /// Divider color
  static Color dividerColorLight = const Color(0x1F000000);

  /// buttonTextColor
  static const Color buttonTextColor = Colors.white;

  static const unSelectedButtonColor = Color(0xffb9b9bb);
  static const unSelectedButtonLabelColor = Colors.black;
  static const selectedButtonLabelColor = Colors.white;
  static const whiteColor = Colors.white;
  static const shadowColor = Color(0x29000000);
  static const appBarIconColor = Color(0xff1b1b1b);
  static final textFieldFocusedColor = appPrimaryColor;
  static const textFieldUnfocusedColor = Color(0xFF9e9e9e);
  static const bodyTextClickableColor = Color(0xFF616161);

  ///
  /// ButtonStyles
  static BoxDecoration buttonDecoration({
    double borderRadius = 0,
    Color? buttonColor,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: buttonColor ?? primaryColor,
    );
  }

  static InputDecoration customTextFieldDecoration(
      {String? hintText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      double? borderRadius,
      double? padding}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      contentPadding: EdgeInsets.all(padding ?? 0),
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}

class AppTheme {
  final bool isDark;

  AppTheme({this.isDark = false}) {
    _screenTitleTextStyle = TextStyle(
      fontSize: ThemePreferences.screenTitleFontSize,
      fontWeight: ThemePreferences.screenTitleFontWeight,
    );

    _bodyTextStyle = TextStyle(
      fontSize: ThemePreferences.bodyTextFontSize,
      fontWeight: ThemePreferences.bodyTextFontWeight,
    );

    _bodyClickableTextStyle = TextStyle(
      fontSize: ThemePreferences.bodyTextClickableFontSize,
      fontWeight: ThemePreferences.bodyClickableTextFontWeight,
      color: ThemePreferences.bodyTextClickableColor,
    );

    _textFieldHintTextStyle = TextStyle(
      fontWeight: ThemePreferences.hintTextFieldTextFontWeight,
    );

    _buttonTextStyle = TextStyle(
      fontSize: ThemePreferences.buttonTextFontSize,
      fontWeight: ThemePreferences.buttonTextFontWeight,
      color: ThemePreferences.buttonTextColor,
    );

    _nameTextStyle = TextStyle(
      fontSize: ThemePreferences.nameTextFontSize,
      fontWeight: ThemePreferences.nameTextFontWeight,
    );

    _nameStackTextStyle = TextStyle(
      fontSize: ThemePreferences.nameTextFontSize,
      fontWeight: ThemePreferences.nameTextFontWeight,
      color: ThemePreferences.whiteColor,
    );

    _checkBoxTextStyle = TextStyle(
      fontWeight: ThemePreferences.checkBoxTextFontWeight,
    );
    _normalTextStyle = const TextStyle(
      color: ThemePreferences.whiteColor,
    );
  }

  /// Screen Title TextStyle
  late TextStyle _screenTitleTextStyle;

  TextStyle get screenTitleTextStyle => _screenTitleTextStyle;

  /// Screen Title TextStyle
  late TextStyle _nameStackTextStyle;

  TextStyle get nameStackTextStyle => _nameStackTextStyle;

  /// normal style
  late TextStyle _normalTextStyle;

  TextStyle get normalTextStyle => _normalTextStyle;

  /// bodyText TextStyle
  late TextStyle _bodyTextStyle;

  TextStyle get bodyTextStyle => _bodyTextStyle;

  /// body Clickable Text TextStyle
  late TextStyle _bodyClickableTextStyle;

  TextStyle get bodyClickableTextStyle => _bodyClickableTextStyle;

  /// TextField HintText TextStyle
  late TextStyle _textFieldHintTextStyle;

  TextStyle get textFieldHintTextStyle => _textFieldHintTextStyle;

  /// ButtonText TextStyle
  late TextStyle _buttonTextStyle;

  TextStyle get buttonTextStyle => _buttonTextStyle;

  /// Name Text TextStyle
  late TextStyle _nameTextStyle;

  TextStyle get nameTextStyle => _nameTextStyle;

  /// CheckBox Text TextStyle
  late TextStyle _checkBoxTextStyle;

  TextStyle get checkBoxTextStyle => _checkBoxTextStyle;
}

///
///
/// Define custom color.
Map<int, Color> primaryColorCodes = {
  50: const Color(0xFF101326),
  100: const Color(0xFF141830),
  200: const Color(0xFF1a1f40),
  300: const Color(0xFF1f264d),
  400: const Color(0xFF242b57),
  500: const Color(0xFF283061),
  600: const Color(0xFF2c356b),
  700: const Color(0xFF323c7a),
  800: const Color(0xFF374287),
  900: const Color(0xFF3d4892),
};

MaterialColor primaryColor = MaterialColor(0xFF3d4892, primaryColorCodes);
