import 'package:flutter/material.dart';
import 'package:globalfancy/common/theam_prefrence.dart';
import 'package:globalfancy/helper/colorExtension.dart';
import 'package:globalfancy/helper/custom_button.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
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
      appBar: AppBar(
        backgroundColor: const Color(0xff3d4892),
        title: helper!.text(),
        centerTitle: true,
      ),
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
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: AspectRatio(
                    aspectRatio: 125 / 125,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/images/talha_image.png',
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
                          "Muhammad Talha",
                          style: ThemePreferences().appTheme.nameTextStyle,
                        ),
                        Text("talha250"),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  buttonColor: colorButtonColor(context),
                  onPress: () {},
                  text: "Follow Back",
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
