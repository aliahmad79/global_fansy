import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globalfancy/helper/colorExtension.dart';

import 'followers.dart';
import 'news_feeds.dart';

class BottomBarHost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomBarHostState();
  }
}

class BottomBarHostState extends State<BottomBarHost> {
  late Helper helper;
  late bool isInit = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      helper = Helper(context, updateState);
      isInit = true;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              helper.buildStatusBar(),
              helper.buildActionBar(),
              Expanded(child: helper.buildTabBody()),
              helper.buildSafeArea(),
            ],
          ),
          helper.buildBottomBar()
        ],
      ),
//        bottomNavigationBar: helper.buildBottomBar(),
    );
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void listenDrawerOpenCloseState(bool isDrawerOpen) {
    Timer(Duration(milliseconds: 20), () {
      helper.isMenuSelected = isDrawerOpen;
      updateState();
    });
  }
}

class Helper {
  BuildContext context;
  late Function updateState;
  bool isFeedSelected = true;
  bool isCourseSelected = false;
  bool isLiveSelected = false;
  bool isEventSelected = false;
  bool isMoreSelected = false;
  bool isMenuSelected = false;
  double tabBodyHeight = 0.0;

  late NewsFeeds newsFeeds;

  Helper(this.context, this.updateState) {
    newsFeeds = NewsFeeds();
  }

  Widget buildStatusBar() {
    return Container(
      height: MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(color: colorSafeArea(context)),
    );
  }

  Widget buildSafeArea() {
    return Container(
      height: MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(color: colorSafeArea(context)),
    );
  }

  Widget buildActionBar() {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(0)),
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildLogoIcon(),
            SizedBox(
              height: 58,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildSearchIcon(),
                  buildCommentIcon(),
                  buildNotificationIcon(),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLogoIcon() {
    return Container(
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        'assets/images/app_logo.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildSearchIcon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 25,
      width: 25,
      child: Image.asset(
        'assets/images/search_bar.png',
      ),
    );
  }

  Widget buildCommentIcon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 25,
      width: 25,
      child: Image.asset(
        'assets/images/msg_icon.png',
      ),
    );
  }

  Widget buildNotificationIcon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 25,
      width: 25,
      child: Image.asset(
        'assets/images/noti_icon.png',
      ),
    );
  }

  Widget buildTabBody() {
    tabBodyHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).viewInsets.bottom +
            58);
    return Column(
      children: <Widget>[
        Container(
          height: isFeedSelected ? tabBodyHeight : 0.0,
          child: newsFeeds,
        ),
        Container(
          height: isCourseSelected ? tabBodyHeight : 0.0,
          child: Center(child: Text('Courses')),
        ),
        Container(
          height: isLiveSelected ? tabBodyHeight : 0.0,
          child: Center(child: Text('Live')),
        ),
        Container(
          height: isEventSelected ? tabBodyHeight : 0.0,
          child: Center(child: Text('Event')),
        ),
        Container(
          height: isMoreSelected ? tabBodyHeight : 0.0,
          child: Center(child: Text('More')),
        ),
      ],
    );
  }

  Widget buildBottomBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Container(
        color: Colors.transparent,
        height: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3D4892),
              ),
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  buildHomeTab(),
                  buildCourseTab(),
                  buildLiveTab(),
                  buildEventTab(),
                  buildMoreTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeTab() {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomBarTapListener(0);
//          newsFeeds.bottomTabChanged(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: isFeedSelected
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                color: isFeedSelected ? Colors.white : Colors.transparent,
                padding: isFeedSelected ? EdgeInsets.all(12) : null,
                child: Image.asset(
                  'assets/images/feed_icon.png',
                  color: isFeedSelected ? Color(0xFF3D4892) : null,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'News Feed',
              style: TextStyle(
                  color: isFeedSelected ? Colors.white : Color(0xFFB9B9BB),
                  fontFamily: 'bold',
                  fontSize: isFeedSelected ? 14 : 13),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseTab() {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomBarTapListener(1);
//          newsFeeds.bottomTabChanged(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: isCourseSelected
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                color: isCourseSelected ? Colors.white : Colors.transparent,
                padding: isCourseSelected ? EdgeInsets.all(12) : null,
                child: Image.asset(
                  'assets/images/course_iocn.png',
                  color: isCourseSelected ? Color(0xFF3D4892) : null,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Course',
              style: TextStyle(
                  color: isCourseSelected ? Colors.white : Color(0xFFB9B9BB),
                  fontFamily: 'bold',
                  fontSize: isCourseSelected ? 14 : 13),
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLiveTab() {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomBarTapListener(2);
//          newsFeeds.bottomTabChanged(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: isLiveSelected
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                color: isLiveSelected ? Colors.white : Colors.transparent,
                padding: isLiveSelected ? EdgeInsets.all(12) : null,
                child: Image.asset(
                  'assets/images/live_iocn.png',
                  color: isLiveSelected ? Color(0xFF3D4892) : null,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Live',
              style: TextStyle(
                  color: isLiveSelected ? Colors.white : Color(0xFFB9B9BB),
                  fontFamily: 'bold',
                  fontSize: isLiveSelected ? 14 : 13),
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEventTab() {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomBarTapListener(3);
//          newsFeeds.bottomTabChanged(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: isEventSelected
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                color: isEventSelected ? Colors.white : Colors.transparent,
                padding: isEventSelected ? EdgeInsets.all(12) : null,
                child: Image.asset(
                  'assets/images/events_iocn.png',
                  color: isEventSelected ? Color(0xFF3D4892) : null,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Event',
              style: TextStyle(
                  color: isEventSelected ? Colors.white : Color(0xFFB9B9BB),
                  fontFamily: 'bold',
                  fontSize: isEventSelected ? 14 : 13),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoreTab() {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomBarTapListener(4);
//          newsFeeds.bottomTabChanged(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: isMoreSelected
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                color: isMoreSelected ? Colors.white : Colors.transparent,
                padding: isMoreSelected ? EdgeInsets.all(12) : null,
                child: Image.asset(
                  'assets/images/more_bottom_iocn.png',
                  color: isMoreSelected ? Color(0xFF3D4892) : null,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'More',
              style: TextStyle(
                  color: isMoreSelected ? Colors.white : Color(0xFFB9B9BB),
                  fontFamily: 'bold',
                  fontSize: isMoreSelected ? 14 : 13),
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  void bottomBarTapListener(int tab) {
    switch (tab) {
      case 0:
        isFeedSelected = true;
        isCourseSelected = false;
        isLiveSelected = false;
        isEventSelected = false;
        isMoreSelected = false;
        break;
      case 1:
        isFeedSelected = false;
        isCourseSelected = true;
        isLiveSelected = false;
        isEventSelected = false;
        isMoreSelected = false;
        break;
      case 2:
        //conversations.refreshConversationList();
        isFeedSelected = false;
        isCourseSelected = false;
        isLiveSelected = true;
        isEventSelected = false;
        isMoreSelected = false;
        break;
      case 3:
        isFeedSelected = false;
        isCourseSelected = false;
        isLiveSelected = false;
        isEventSelected = true;
        isMoreSelected = false;
        break;
      case 4:
        isFeedSelected = false;
        isCourseSelected = false;
        isLiveSelected = false;
        isEventSelected = false;
        isMoreSelected = true;
        break;
    }
    updateState();
  }
}
