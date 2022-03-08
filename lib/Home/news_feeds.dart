import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsFeeds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsFeedsState();
  }
}

class NewsFeedsState extends State<NewsFeeds> {
  late Helper helper;
  late bool isInit = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      helper = Helper(context, updateState);
      isInit = true;
    }
    return Container(
      color: Color(0xFFE4E4E4),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              helper.searchBar(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: helper.postList(),
              ),
            ],
          ),
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
  BuildContext context;
  Function updateState;
  ScrollController postScrollControllerVertical = ScrollController();
  int imageIndex = 0;
  String searchText = '';
  PageController tabsScrollController = PageController();

  Helper(this.context, this.updateState) {}

  Widget buildStatusBar() {
    return Container(
      height: MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
    );
  }

  Widget buildActionBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 60.0,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 2,
              ),
              Navigator.canPop(context)
                  ? InkWell(
                      onTap: () async {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 12),
                        child: Image.asset(
                          'assets/images/back_arrow_ar.png',
                        ),
                      ),
                    )
                  : Container(
                      width: 15,
                    ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontFamily: 'bold',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            width: 50,
            child: AspectRatio(
              aspectRatio: 128 / 128,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/images/talha_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {},
//              focusNode: searchFieldNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: const TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'medium',
                  color: Color(0xFF656667),
                ),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                    borderRadius: BorderRadius.circular(40.0)),
                contentPadding: EdgeInsets.all(15),
              ),

              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'medium',
                color: Color(0xFF666666),
              ),
              maxLines: 1,
              onChanged: (value) {
                searchText = value;
              },
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }

  Widget postList() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const ClampingScrollPhysics(),
        itemBuilder: postItem,
        shrinkWrap: false,
        controller: postScrollControllerVertical,
      ),
    );
  }

  Widget postItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 50,
                child: AspectRatio(
                  aspectRatio: 128 / 128,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/images/talha_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Muhammad Talha',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'bold'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Just Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'bold'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 15),
                child: Image.asset(
                  'assets/images/more_icon.png',
                  fit: BoxFit.cover,
                  width: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Enjoying Dinner at Monal",
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'regular')),
          ),
          imagesView(),
          buildPostactions(),
          Container(
            height: 10,
            color: Color(0xFFE4E4E4),
          )
        ],
      ),
    );
  }

  Widget imagesView() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
//      width: size.width,
      child: Stack(
        // alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //page view
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 235,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: PageView.builder(
                      controller: tabsScrollController,
                      itemBuilder: productPageViewWidget,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 8,
                      onPageChanged: (changedPage) {
                        imageIndex = changedPage;
                        updateState();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          buildPageViewIndicator(),
        ],
      ),
    );
  }

  Widget productPageViewWidget(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/talha_image.png',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPageViewIndicator() {
    return Positioned(
      bottom: 30,
      child: Container(
        height: 12,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (indicatorContext, int index) {
              if (imageIndex == index) {
                return Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              } else {
                return Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPostactions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '0 react on post',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/images/like_icon.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/comment_icon.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/share_icon.png'),
                  ],
                ),
              ),
              const Text(
                '5 Comments, 3 shares',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
