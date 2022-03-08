import 'package:flutter/material.dart';
import 'package:globalfancy/Screens/search/search_model.dart';
import 'package:globalfancy/common/theam_prefrence.dart';

class HashtagsSearchScreen extends StatefulWidget {
  const HashtagsSearchScreen({Key? key}) : super(key: key);

  @override
  _HashtagsSearchScreenState createState() => _HashtagsSearchScreenState();
}

class _HashtagsSearchScreenState extends State<HashtagsSearchScreen> {
  Helper? helper;
  bool isInit = false;
  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      helper = Helper(context, updateState);
      isInit = true;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          helper!.buildBodyBar(),
        ],
      ),
    );
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }
}

class Helper {
  late BuildContext context;
  late Function updateState;

  Helper(this.context, this.updateState) {}

  Widget buildBodyBar() {
    List<SearchModel> users = [
      SearchModel(
        name: "Muhammad Rizwan",
        image: "assets/images/talha_image.png",
      ),
      SearchModel(
        name: "Muhammad Talha",
        image: "assets/images/talha_image.png",
      ),
      SearchModel(
        name: "Global Fansy",
        image: "assets/images/talha_image.png",
      ),
    ];
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: users
            .map(
              (e) => Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: AspectRatio(
                            aspectRatio: 128 / 128,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Icon(Icons.tag),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // margin: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name!,
                                  style:
                                      ThemePreferences().appTheme.nameTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
