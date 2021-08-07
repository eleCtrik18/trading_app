import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/screens/chat_component/body.dart';
import 'package:trading_app/screens/chat_component/constants.dart';
import 'package:trading_app/screens/user_info.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
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
              ' Chat Screen',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 17,
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
      body: Body(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.messenger), label: "All Chats"),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back), label: "Incoming Chats"),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward), label: "Outgoing Chats"),
      ],
    );
  }
}
