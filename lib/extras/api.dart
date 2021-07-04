// // @dart=2.9

// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:trading_app/user.dart';

// class UsersApi {
//   static Future<List<User>> getUsers() async {
//     var url =
//         'https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/other%2Fvideo126%2Fusers.json?alt=media';
//     http.Response response = await http.get(Uri.parse(url));
//     final body = json.decode(response.body);

//     return body.map<User>(User.fromJson).toList();
//   }

//   static Future<List<User>> getUsersLocally(BuildContext context) async {
//     final assetBundle = DefaultAssetBundle.of(context);
//     final data = await assetBundle.loadString('assets/users.json');
//     final body = json.decode(data);

//     return body.map<User>(User.fromJson).toList();
//   }
// }

// UsersApi usersApi;
// fetchdata() {
//   for (int i = 0; i < 3; i++) {
//     usersApi;
//   }
// }
