import 'package:flutter/material.dart';
import 'package:globalfancy/Screens/search/search_model.dart';
import 'package:globalfancy/common/theam_prefrence.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
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

  Widget text() {
    return const Text("Followers");
  }

  Widget buildBodyBar() {
    List<SearchModel> users = [
      SearchModel(
        name: "Muhammad Rizwan",
        description: "rizwan20",
        image: "assets/images/talha_image.png",
      ),
      SearchModel(
        name: "Muhammad Talha",
        description: "talha250",
        image: "assets/images/talha_image.png",
      ),
      SearchModel(
        name: "Muhammad Talha",
        description: "talha250",
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
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: AspectRatio(
                            aspectRatio: 128 / 128,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                e.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name!,
                                  style:
                                      ThemePreferences().appTheme.nameTextStyle,
                                ),
                                Text(e.description!),
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
