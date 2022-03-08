import 'package:flutter/material.dart';
import 'package:globalfancy/Screens/search/hashtags_screen.dart';
import 'package:globalfancy/Screens/search/search_events_screen.dart';
import 'package:globalfancy/Screens/search/search_model.dart';
import 'package:globalfancy/Screens/search/search_users_screen.dart';
import 'package:globalfancy/common/theam_prefrence.dart';
import 'package:globalfancy/helper/colorExtension.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            children: [
              helper!.searchBar(),
              helper!.tabController(),
              // helper!.buildBodyBar(),
            ],
          ),
        ),
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
  bool isSelected = true;

  Helper(this.context, this.updateState) {}

  Widget text() {
    return const Text("Search");
  }

  Widget searchBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          suffixIcon: Container(
              decoration: BoxDecoration(
                color: colorMainColor(context),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 60,
              height: 60,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))),
          hintText: "Search...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget tabController() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            TabBar(
              // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? colorMainColor(context) : Colors.grey),
              tabs: const [
                Tab(
                  text: "USERS",
                ),
                Tab(
                  text: "EVENTS",
                ),
                Tab(
                  text: "HASHTAGS",
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height, //height of TabBarView
              child: const TabBarView(
                children: <Widget>[
                  UserSearchScreen(),
                  SearchEventsScreen(),
                  HashtagsSearchScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
