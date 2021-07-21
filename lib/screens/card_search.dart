import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class CardSearch extends StatefulWidget {
  const CardSearch({Key? key}) : super(key: key);

  @override
  _CardSearchState createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  final _chipKey = GlobalKey<ChipsInputState>();
  String? valChoose;
//For the drop down

  List<String> listItem = ['Music Card', 'Dance Card', 'Party Card'];
  List<String> listItem2 = ['Category 1', 'Category 2', 'Category 2'];
  List<String> listItem3 = [
    'Sub-Category 1',
    'Sub-Category 2',
    'Sub-Category 2'
  ];
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
                ' Card Search',
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
                  },
                ),
                Text('  '),
              ],
            ),
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Stack(children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      searchBar(context),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // dropdown1(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // dropdown2(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // dropdown3(),
                      SizedBox(height: 40),
                      box()
                    ],
                  ),
                ),
              )
            ])));
  }

  Widget searchBar(BuildContext context) {
    const mockResults = <AppProfile>[
      AppProfile('John Doe', 'jdoe@flutter.io',
          'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
      AppProfile('Paul', 'paul@google.com',
          'https://mbtskoudsalg.com/images/person-stock-image-png.png'),
      AppProfile('Fred', 'fred@google.com',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Brian', 'brian@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('John', 'john@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Thomas', 'thomas@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Nelly', 'nelly@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Marie', 'marie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Charlie', 'charlie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Diana', 'diana@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Ernie', 'ernie@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
      AppProfile('Gina', 'fred@flutter.io',
          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
    ];
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 4.7,
            width: _w / 0.16,
            padding: EdgeInsets.symmetric(horizontal: _w / 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: ChipsInput(
              autocorrect: true,
              key: _chipKey,
              keyboardAppearance: Brightness.dark,
              textCapitalization: TextCapitalization.words,
              enabled: true,
              maxChips: 5,
              textStyle: const TextStyle(
                  height: 1.5, fontFamily: 'Roboto', fontSize: 16),
              decoration: const InputDecoration(
                labelText: 'Search Cards',
              ),
              findSuggestions: (String query) {
                if (query.isNotEmpty) {
                  var lowercaseQuery = query.toLowerCase();
                  return mockResults.where((profile) {
                    return profile.name
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        profile.email
                            .toLowerCase()
                            .contains(query.toLowerCase());
                  }).toList(growable: false)
                    ..sort((a, b) => a.name
                        .toLowerCase()
                        .indexOf(lowercaseQuery)
                        .compareTo(
                            b.name.toLowerCase().indexOf(lowercaseQuery)));
                }
                // return <AppProfile>[];
                return mockResults;
              },
              onChanged: (data) {
                // print(data);
              },
              chipBuilder: (context, state, profile) {
                return InputChip(
                  key: ObjectKey(profile),
                  label: Text('Event Card'),
                  onDeleted: () => state.deleteChip(profile),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              },
              suggestionBuilder: (context, state, profile) {
                return Container(
                  child: Column(children: [
                    ListTile(
                      key: ObjectKey(profile),
                      title: Text('Music Card'),
                      onTap: () => state.selectSuggestion(profile),
                    ),
                    ListTile(
                      title: Text('Sports Card'),
                      onTap: () => state.selectSuggestion(profile),
                    ),
                    ListTile(
                      title: Text('Commute Card'),
                      onTap: () => state.selectSuggestion(profile),
                    ),
                  ]),
                );
              },
            ),
            // TextField(
            //   maxLines: 1,
            //   decoration: InputDecoration(
            //     fillColor: Colors.transparent,
            //     filled: true,
            //     hintStyle: TextStyle(
            //         color: Colors.black.withOpacity(.4),
            //         fontWeight: FontWeight.w600,
            //         fontSize: _w / 22),
            //     prefixIcon:
            //         Icon(Icons.search, color: Colors.black.withOpacity(.6)),
            //     hintText: 'Search by Card Name',
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         borderSide: BorderSide.none),
            //     contentPadding: EdgeInsets.zero,
            //   ),
            // ),
          ),
          SizedBox(
            height: _w / 20,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     'OR',
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // )
        ],
      ),
    );
  }

  dropdown1() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 14),
      decoration: BoxDecoration(
          color: Color(0xffedeef6),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 0, offset: Offset(0, 0))
          ]),
      child: DropdownButton(
          hint: Text(
            'All Cards',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          dropdownColor: Colors.grey[400],
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: TextStyle(color: Colors.black87),
          underline: SizedBox(),
          value: valChoose,
          onChanged: (newValue) {
            setState(() {
              valChoose = newValue as String?;
              print(valChoose);
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList()),
    );
  }

  dropdown2() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 14),
      decoration: BoxDecoration(
          color: Color(0xffedeef6),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 0, offset: Offset(0, 0))
          ]),
      child: DropdownButton(
          hint: Text(
            'Select Category',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          dropdownColor: Colors.grey[400],
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: TextStyle(color: Colors.black87),
          underline: SizedBox(),
          value: valChoose,
          onChanged: (newValue) {
            setState(() {
              valChoose = newValue as String?;
              print(valChoose);
            });
          },
          items: listItem2.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList()),
    );
  }

  dropdown3() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 14),
      decoration: BoxDecoration(
          color: Color(0xffedeef6),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 0, offset: Offset(0, 0))
          ]),
      child: DropdownButton(
          hint: Text(
            'Select Sub-Category',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          dropdownColor: Colors.grey[400],
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: TextStyle(color: Colors.black87),
          underline: SizedBox(),
          value: valChoose,
          onChanged: (newValue) {
            setState(() {
              valChoose = newValue as String?;
              print(valChoose);
            });
          },
          items: listItem3.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList()),
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
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                shape: BoxShape.rectangle,
                color: Colors.blue[300]),
            child: Text(
              "SHARE",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class AppProfile {
  final String name;
  final String email;
  final String imageUrl;

  const AppProfile(this.name, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}
