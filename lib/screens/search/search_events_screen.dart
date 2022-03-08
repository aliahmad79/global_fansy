import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalfancy/common/theam_prefrence.dart';
import 'package:globalfancy/screens/search/search_event_model.dart';

class SearchEventsScreen extends StatefulWidget {
  const SearchEventsScreen({Key? key}) : super(key: key);

  @override
  _SearchEventsScreenState createState() => _SearchEventsScreenState();
}

class _SearchEventsScreenState extends State<SearchEventsScreen> {
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
    List<SearchEventsModel> searchEvents = [
      SearchEventsModel(
        name: "Muhammad Rizwan",
        avatarImage: "assets/images/talha_image.png",
        image: "assets/images/talha_image.png",
        profession: "Motivational Speaker",
        city: "Lahore",
        icon: Icons.location_on,
      ),
      SearchEventsModel(
        name: "Muhammad Rizwan",
        avatarImage: "assets/images/talha_image.png",
        image: "assets/images/talha_image.png",
        city: "Islamabad",
        profession: "Android Developer",
        icon: Icons.location_on,
      ),
    ];
    return Column(
      children: searchEvents
          .map(
            (e) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 290,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    shadowColor: Colors.grey,
                    child: Column(
                      children: [
                        Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(e.image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            // child: Image(
                            //   image: AssetImage(e.image!),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Positioned(
                            top: 150,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.profession!,
                                  style: ThemePreferences()
                                      .appTheme
                                      .nameStackTextStyle,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      e.icon,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      e.city!,
                                      style: ThemePreferences()
                                          .appTheme
                                          .normalTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  e.name!,
                                  style:
                                      ThemePreferences().appTheme.nameTextStyle,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
