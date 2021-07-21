import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/screens/user_info.dart';
import 'package:trading_app/utility/deck_view.dart';
import 'package:trading_app/utility/slider.dart';

class CardManager extends StatefulWidget {
  const CardManager({Key? key}) : super(key: key);

  @override
  _CardManagerState createState() => _CardManagerState();
}

class _CardManagerState extends State<CardManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.green.withOpacity(.5),
            elevation: 0,
            title: Text(
              ' Card Manager',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 17,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'Add',
                splashColor: Colors.transparent,
                highlightColor: Colors.orange,
                icon: Icon(Icons.add, color: Colors.black.withOpacity(.7)),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return UserInfo();
                    }),
                  );
                },
              ),
              Text('  '),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            topheader(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Cardslider(),
            ),
            SizedBox(
              height: 20,
            ),
            middletext(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: deckview(),
            )
          ],
        ),
      ),
    );
  }

  header1() {
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
              tooltip: 'Settings',
              icon: Icon(Icons.text_fields,
                  size: _w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  header2() {
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
              tooltip: 'Settings',
              icon: Icon(Icons.list,
                  size: _w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  header3() {
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
              tooltip: 'Settings',
              icon: Icon(Icons.grid_on_rounded,
                  size: _w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  topheader() {
    double _w = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(_w / 20, _w / 10, 0, 0),
            child: Text(
              'ALL CARDS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          header1(),
          header2(),
          header3()
        ],
      ),
    );
  }

  middletext() {
    double _w = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(_w / 20, _w / 10, 0, 0),
            child: Text(
              'DECK VIEW',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  deckview() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return box();
          }
          //=> Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Color(0xffFFE5B4),
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Colors.black.withOpacity(.05), blurRadius: 5),
          //         ],
          //       ),
          //       height: _w / 1.8,
          //       width: 200,
          //       child: Center(child: Text('Card Preview')),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Container(
          //       child: Center(
          //         child: Text(
          //           'Deck Name',
          //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     )
          //   ]),
          // ),
          ),
    );
  }

  Widget box() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: _w / 1.8,
                    width: 110,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.green,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: _w / 1.8,
                    width: 125,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: _w / 1.8,
                width: 140,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  shape: BoxShape.rectangle,
                  border: new Border.all(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
              ),
              Positioned.fill(
                left: 10,
                top: 10,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Card Preview",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ))),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "DECK NAME",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
