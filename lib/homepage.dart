// @dart=2.9

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/user_info.dart';
import 'package:http/http.dart' as http;

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  // ignore: deprecated_member_use
  List<String> dogImages = new List();
  ScrollController _scrollController = new ScrollController();
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    fetchfive();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchfive();
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: dogImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _w / 1.16,
                          height: _w / 1.8,
                          decoration: BoxDecoration(
                            color: Color(0xffFFE5B4),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.05),
                                  blurRadius: 90,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: _w / 1.16,
                                height: _w / 2.6,
                                decoration: BoxDecoration(
                                  color: Color(0xff5C71F3),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(dogImages[index],
                                    fit: BoxFit.cover,
                                    width: _w / 1.36,
                                    height: _w / 2.6),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: _w / 6.2,
                                width: _w / 2.36,
                                padding:
                                    EdgeInsets.symmetric(horizontal: _w / 25),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ('Dog'),
                                      textScaleFactor: 1.4,
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.8),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      ('Subtitle'),
                                      textScaleFactor: 1,
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  // child: Image.network(
                  //   dogImages[index],
                  //   fit: BoxFit.fitWidth,
                  // ),
                );
              }

              // searchBar(),
              // SizedBox(height: _w / 20)
              // groupOfCards(
              //   'Item 1',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 2',
              //   // 'Sub info',
              //   // 'assets/event.png',
              //   // RouteWhereYouGo()
              // ),
              // groupOfCards(
              //   'Item 2',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 4',
              //   // 'Sub info',
              //   // 'assets/event.png',
              //   // RouteWhereYouGo()
              // ),
              // groupOfCards(
              //   'Item 3',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 6',
              //   // 'Sub info',
              //   // 'assets/event.png',
              //   // RouteWhereYouGo()
              // ),
              // groupOfCards(
              //   'Item 4',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 8',
              //   // 'Sub info',
              //   // 'assets/event.png',
              //   // RouteWhereYouGo()
              // ),
              // groupOfCards(
              //   'Item 5',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 10',
              //   // 'Sub info',
              //   // 'assets/event.png',

              //   // RouteWhereYouGo()
              // ),
              // groupOfCards(
              //   'Item 6',
              //   'Sub info',
              //   'assets/event.png',
              //   RouteWhereYouGo(),
              //   // 'Item 12',
              //   // 'Sub info',
              //   // 'assets/event.png',
              //   // RouteWhereYouGo()
              // ),

              ),
          settingIcon(),
        ],
      ),
    );
  }

  fetch() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        setState(() {
          dogImages.add(jsonDecode(response.body)['message']);
        });
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  fetchfive() {
    for (int i = 0; i < 3; i++) {
      fetch();
    }
  }

  Widget settingIcon() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, _w / 10, _w / 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: _w / 8.5,
            width: _w / 8.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              tooltip: 'User info',
              icon: Icon(Icons.person,
                  size: _w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {
                Navigator.of(context).push(
                  MyFadeRoute(route: UserInfo(), page: UserInfo()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w / 1.36,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                    fontSize: _w / 22),
                prefixIcon:
                    Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Search anything.....',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: _w / 14),
          Container(
            width: _w / 1.15,
            child: Text(
              'Hello User',
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget groupOfCards(
    String title1,
    String subtitle1,
    String image1,
    Widget route1,
  ) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          card(title1, subtitle1, image1, route1),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context)
              .push(MyFadeRoute(route: route, page: RouteWhereYouGo()));
        },
        child: Container(
          width: _w / 1.16,
          height: _w / 1.8,
          decoration: BoxDecoration(
            color: Color(0xffFFE5B4),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 90,
                  offset: Offset(2, 2)),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: _w / 1.16,
                height: _w / 2.6,
                decoration: BoxDecoration(
                  color: Color(0xff5C71F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Image.asset(image,
                    fit: BoxFit.cover, width: _w / 1.36, height: _w / 2.6),
              ),
              Container(
                alignment: Alignment.center,
                height: _w / 6.2,
                width: _w / 2.36,
                padding: EdgeInsets.symmetric(horizontal: _w / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.4,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      textScaleFactor: 1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({this.page, this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('Cards Info Page',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
