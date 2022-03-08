import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomLoader extends StatelessWidget {
  bool showLoading;
  Color loaderColor;

  CustomLoader({required this.loaderColor, this.showLoading = false,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return showLoading ? Container(
      width: width,
      height: height,
      color: Colors.black26,
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: CircularProgressIndicator(
              valueColor:
              new AlwaysStoppedAnimation<Color>(loaderColor)),
        ),
      ),
    ) : SizedBox();
  }

}