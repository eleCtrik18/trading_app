import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
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
              ' Rishi',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 17,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'Info',
                splashColor: Colors.transparent,
                highlightColor: Colors.orange,
                icon: Icon(Icons.info, color: Colors.black.withOpacity(.7)),
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
      body: Stack(
        children: [
         
          Container(
              child: Row(
            children: [Text('Trade Status'), Text("Ongoing")],
          ))
        ],
      ),
    );
  }
}
