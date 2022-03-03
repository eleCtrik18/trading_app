//We can use Drawer as a separate entity or as an object extension of appbar itself(Checkout appbar component for usage of Drawer)
//Drawer is a material design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application



Scaffold(
      drawer: Drawer(
        child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      )),
    );


