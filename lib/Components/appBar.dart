//Custom Appbar
//Using Preferred Size to Make Custom designed AppBar
//This widget does not impose any constraints on its child, and it doesn't affect the child's layout in any way. It just advertises a preferred size which can be used by the parent.


appBar: PreferredSize(
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
