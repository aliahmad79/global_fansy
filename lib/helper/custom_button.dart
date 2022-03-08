import 'package:flutter/material.dart';

import '../common/theam_prefrence.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color buttonColor;
  final Color textColor;
  final EdgeInsets padding;
  final EdgeInsets margin;

  final double? borderRadius;
  final double? height;
  final double? width;

  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.buttonColor = Colors.indigo,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor = Colors.white,
    this.borderRadius,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: padding,
        margin: margin,
        height: height ?? size.height * 0.065,
        decoration: ThemePreferences.buttonDecoration(
          buttonColor: buttonColor,
          borderRadius: borderRadius ?? size.height * 0.02248,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: Colors.white,
                ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: ThemePreferences().appTheme.buttonTextStyle,
              ),
              if (suffixIcon != null) Icon(suffixIcon),
            ],
          ),
        ),
      ),
    );
  }
}
