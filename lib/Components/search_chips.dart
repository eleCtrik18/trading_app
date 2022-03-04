//It Requires a package called Flutter Chip 
//A material design chip.

//Chips are compact elements that represent an attribute, text, entity, or action.

//Supplying a non-null onDeleted callback will cause the chip to include a button for deleting the chip.


Widget searchBar(BuildContext context) { //Creating Mock Search Items for demonstration
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
            child: ChipsInput( //Inbuilt object of Package Flutter Chip
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
