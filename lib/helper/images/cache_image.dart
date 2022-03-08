import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
CachedNetworkImage CacheImage(String imageurl, String placeholder,BoxFit fit) {
  return CachedNetworkImage(
    fit: fit,
    imageUrl: imageurl,
    fadeInCurve: Curves.easeOutCirc,
    fadeInDuration: Duration(seconds: 1),
    placeholder: (context, url) =>
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(child: CupertinoActivityIndicator()
          ),
        ),
    errorWidget: (context, url, error) =>
        Image.asset(
          placeholder,
          fit: fit,
        ),
  );
}

