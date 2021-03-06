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
  int i;
  // ignore: deprecated_member_use
  List<String> dogImages = new List();
  ScrollController _scrollController = new ScrollController();
  AnimationController _controller;
  Animation<double> _animation;

//Calling fetchfive function in initState so that as soon as Widgets Render it automatically gets called//
  @override
  void initState() {
    super.initState();
    print("Show Circular Bar");
    fetchfive();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("Show Circular Bar 2");
        fetchfive();
        showLoading();
      }
    });
    //Calling fetchfive function in initState so that as soon as Widgets Render it automatically gets called//

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
      appBar: appBar(),
      drawer: Drawer(),
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: dogImages.length,
              itemBuilder: (BuildContext context, int index) {
                if (i == dogImages.length) {
                  return Container(
                      padding: EdgeInsets.all(2),
                      child: Center(child: CircularProgressIndicator()));
                } else
                  return Container(
                    padding:
                        EdgeInsets.fromLTRB(_w / 20, _w / 5, _w / 20, _w / 20),

                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  _w / 20, 0, _w / 20, _w / 20),
                            ),
                            Container(
                              width: _w / 1.16,
                              height: _w / 0.7,
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
                                    width: _w / 0.16,
                                    height: _w / 1.6,
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
                                    alignment: Alignment.bottomCenter,
                                    height: _w / 6.2,
                                    width: _w / 2.36,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _w / 25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ('Dog ${index + 1}'),
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
                                          ('SubInfo'),
                                          textScaleFactor: 1,
                                          maxLines: 1,
                                          softWrap: true,
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
                    ),
                    // child: Image.network(
                    //   dogImages[index],
                    //   fit: BoxFit.fitWidth,
                    // ),
                  );
              }),
          Container(
            alignment: Alignment.center,
            child: searchBar(),
          ),
        ],
      ),
    );
  }
//Circular Bar to show data is fetching//
  showLoading([String message]) {
    Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  //Circular Bar to show data is fetching//

  hideLoading() {}
//Fetch Function loading data from URL//
  fetch() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    showLoading();
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
  //Fetch Function loading data from URL//
//------------------------------------------------------//  
//Function that calls API fetch function//
  fetchfive() {
    for (int i = 0; i < 3; i++) {
      setState(() {});
      fetch();
    }
  }
  //Function that calls API fetch function//
  //----------------------------------------------------------------------------------//
  //Setting Icon//

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
  
  //Setting Icon//
/------------------------------------------------------------------------------------------------------------- /
  //AppBar Component//

  Widget appBar() {
    double _w = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size(double.infinity, kToolbarHeight),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.green.withOpacity(.5),
          elevation: 0,
          title: Text(
            ' Trading App',
            style: TextStyle(
              fontSize: _w / 17,
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: 'User',
              splashColor: Colors.transparent,
              highlightColor: Colors.orange,
              icon: Icon(Icons.person, color: Colors.black.withOpacity(.7)),
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UserInfo();
                    },
                  ),
                );
              },
            ),
            Text('  '),
          ],
        ),
      ),
    );
  }
  //AppBar Component//
//-------------------------------------------------------------------------------------------------------------------//  
//Search Bar Component//
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
        ],
      ),
    );
  }
  
  //Search Bar Component//
 //-----------------------------------------------------------------------------------------------------// 
  //A Conatiner for rendering Cards Together//

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
 //A Conatiner for rendering Cards Together//
  
  //Card Component//

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


//Card Component//
//-------------------------------------------------------------------------------------------------------------------------//
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
//AppBar Component//
class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('User Info Page',
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
//AppBAr component//
