import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFieldWithTitle extends StatefulWidget {
  final String title, hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscure;
  final String? Function(String?)? validator;
  final bool requiredField;
  final bool enabled;
  final int maxLine;
  final TextInputType? inputType;
  final Function(String?)? onChanged;
  final bool isInputFormatter;
  final bool isIntegerFormatter;
  final bool isPhoneFormatter;
  final bool isDoubleFormatter;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Color? fillColor;
  final TextDirection? textDirection;
  final Widget? titleSuffix;
  int? maxLength;

  CommonTextFieldWithTitle(
      this.title, this.hintText, this.controller, this.validator,
      {this.suffixIcon,
      this.prefixIcon,
      this.obscure = false,
      this.requiredField = true,
      this.enabled = true,
      this.maxLine = 1,
      this.inputType,
      this.onChanged,
      this.onTap,
      this.isInputFormatter = false,
      this.isIntegerFormatter = false,
      this.isPhoneFormatter = false,
      this.isDoubleFormatter = false,
      this.maxLength,
      this.textDirection,
      this.fillColor,
      this.titleSuffix});

  @override
  _CommonTextFieldWithTitleState createState() =>
      _CommonTextFieldWithTitleState();
}

class _CommonTextFieldWithTitleState extends State<CommonTextFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.title != ''
            ? Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.title,
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'medium')),
                        const SizedBox(
                          width: 2,
                        ),
                        widget.requiredField
                            ? const Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'medium',
                                    color: Color(0xFFD32F2F)),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  widget.titleSuffix ?? Container(),
                ],
              )
            : Container(),
        widget.title != ''
            ? const SizedBox(
                height: 10,
              )
            : Container(),
        TextFormField(
          textDirection: widget.textDirection,
          onTap: widget.onTap,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscure,
          inputFormatters: widget.isInputFormatter
              ? [
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-z A-Z. \u0600-\u06FF]")),
                ]
              : widget.isIntegerFormatter
                  ? [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ]
                  : widget.isPhoneFormatter
                      ? [
                          FilteringTextInputFormatter.allow(RegExp("[+0-9]")),
                        ]
                      : widget.isDoubleFormatter
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[.0-9]")),
                            ]
                          : null,
          style: const TextStyle(
              color: Color(0xFF616161), fontFamily: 'light', fontSize: 16),
          maxLines: widget.maxLine,
          keyboardType: widget.inputType ?? TextInputType.text,
          onChanged: widget.onChanged ?? (val) {},
          cursorColor: Theme.of(context).primaryColor,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              labelText: widget.hintText,
              fillColor: widget.fillColor ?? Colors.white,
              filled: true,
              counter: widget.maxLength != null ? const SizedBox.shrink() : null,
              errorStyle: const TextStyle(
                  color: Colors.red, fontFamily: 'regular', fontSize: 13),
              enabledBorder: outlineInputBorder(false),
              errorBorder: outlineInputBorder(true),
              focusedBorder: outlineInputBorder(false, isFocused: true),
              focusedErrorBorder: outlineInputBorder(false, isFocused: true),
              disabledBorder: outlineInputBorder(false),
              suffixIcon: widget.suffixIcon,
              enabled: widget.enabled,
              labelStyle: const TextStyle(
                  color: Color(0xFF616161),
                  fontFamily: 'light',
                  fontSize: 14),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12)),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder(bool isErrorBorder,
      {bool isFocused = false}) {
    Color c;
    if (isErrorBorder) {
      c = Colors.red;
    } else {
      if (isFocused) {
        c = const Color(0xFF616161);
      } else {
        c = const Color(0xFF616161);
      }
    }
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: c,
        ),
        borderRadius: BorderRadius.circular(20));
  }
}
