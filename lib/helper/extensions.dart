import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globalfancy/helper/colorExtension.dart';
import 'package:globalfancy/helper/locolizations.dart';
import 'package:globalfancy/helper/utilities.dart';

import 'images/images.dart';

String capitalize(String s) =>
    s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);

double heightNavigation(BuildContext context) {
  return 60;
}

Fluttertoast? showToastMsg(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: colorToastBackground(context),
      textColor: colorToastText(context),
      fontSize: 16.0);
}

Container bottomSafeArea(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).padding.bottom,
    width: MediaQuery.of(context).size.width,
    color: colorSafeArea(context),
  );
}

Image backImage() {
  return Image.asset(
    Utilities.language.contains('en')
        ? Images.backArrow_en
        : Images.backArrow_ar,
  );
}

Visibility showBottomLoader(BuildContext context, bool api) {
  return Visibility(
      visible: api, child: const Center(child: CupertinoActivityIndicator()));
}

Center noDataAvailable(BuildContext context, bool isShow) {
  return Center(
    child: Visibility(
      visible: isShow,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Text(
          AppLocalizations.of(context)!.trans('no_data_available'),
          style: const TextStyle(
              fontFamily: 'light', color: Colors.black54, fontSize: 17),
        ),
      ),
    ),
  );
}

Container statusBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    width: MediaQuery.of(context).size.width,
    color: colorSafeArea(context),
  );
}
