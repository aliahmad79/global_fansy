import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalfancy/helper/ApiUrl.dart';
import 'locolizations.dart';

class Utilities {
  static String language = 'en';
  static String currency = '';
  static String web_url = '';
  static String base_url = 'aed';
  static String type = 'user';
  static Color safeAreaColor = Colors.white;
  static int notificationCount = 2;
  static int cartCount = 4;
  static bool isGuest = false;
//  static LatLng latlng = LatLng(25.2048, 55.2708);

  static String resizeImageWithCrop(
      String baseUrl, String path, double height, double width, int isCrop) {
    height *= 1.8;
    width *= 1.8;
    // "https://alpha3.mytechnology.ae/heuor/images/timthumb.php?src=uploads/media/ajman_trade_licence-1634709319.jpg&amp;w=200&amp;h=122&amp;zc=1&amp;q=90&amp;s=0"
    String url = baseUrl +
        "images/timthumb.php?src=" +
        path +
        "&w=" +
        width.toString() +
        "&h=" +
        height.toString() +
        "&zc=" +
        isCrop.toString() +
        '&q=90&s=0';
    //print(url);
    return url;
  }

  static String resizeImage(
      String path, int height, int width, int crop, int quality) {
    String url = '';

    url = ApiUrl.base_Url + 'images/timthumb.php?src=' + path;
    if (width != 0) {
      url += '&w=' + (width * 2).toString();
      url += '&h=' + (height * 2).toString();
      url += '&zc=' + crop.toString();
      url += '&q=' + quality.toString();
      url += '&s=0';
    }
    return url;
//    return path;
  }

  static String makeFirstLetterOfWordCapital(String text) {
    List<String> splittedString = text.split(' ');
    String resultString = '';
    for (int i = 0; i < splittedString.length; i++) {
      splittedString[i] =
          splittedString[i][0].toUpperCase() + splittedString[i].substring(1);
      resultString += splittedString[i];
      if (i != splittedString.length - 1) {
        resultString += ' ';
      }
    }
    return resultString;
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  static bool isPhone(String em) {
    String p = r'^(\+|^00|^0)[0-9]';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

// static String selectedDayFromDateTime(int date) {
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
//   return DateFormat('dd MMM EEE').format(dateTime);
// }
// static String isoDateToRequiredFormate(String isoDateTime, BuildContext context, String format){
//   if(isoDateTime == null){
//     return  'null';
//   }
//   else if(isoDateTime.isEmpty){
//     return  '';
//   }
//   DateFormat requiredFormat = DateFormat(format);
//   DateTime dateTime = DateTime.parse(isoDateTime);
//   return requiredFormat.format(dateTime.add(DateTime.now().timeZoneOffset));
// }
}

Center noDataAvailable(BuildContext context, bool isShow) {
  return Center(
    child: Visibility(
      visible: isShow,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Text(
          AppLocalizations.of(context)!.trans('no_data_available'),
          style: TextStyle(
              fontFamily: 'light', color: Colors.black54, fontSize: 17),
        ),
      ),
    ),
  );
}
