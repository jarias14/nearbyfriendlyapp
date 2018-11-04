import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'sports_icons.dart';

void main() => runApp(new MyApp());

class Choice {
  const Choice({this.title, this.image});

  final String title;
  final AssetImage image;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Car', image: AssetImage("assets/graphics/001-football.png")),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    final TextStyle textStyle2 = Theme.of(context).textTheme.body1;
    return new GestureDetector(
      //onTap: ,
      child: Card(
        color: Colors.white,
        child: Row(children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                    'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(AssetImage("assets/graphics/001-football.png"),
                      size: 50.0, color: textStyle.color),
                  //Text(choice.title, style: textStyle),
                  //Image.network(
                  //'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                  //),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Text(
                  "Soccer @ 7am, today with Tomas and others...",
                  style: Theme.of(context).textTheme.body1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
          ),
        ]),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  PlaceDetails _place;

  @override
  void initState() {
    super.initState();
    FlutterPlacesDialog.setGoogleApiKey(
        /*"AIzaSyBVJ6DGEqQv4lRicySx0siZTCk-9lXY6lY" */ "");
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  showPlacePicker() async {
    PlaceDetails place;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await FlutterPlacesDialog.getPlacesDialog();
    } on PlatformException {
      place = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    print("$place");
    setState(() {
      _place = place;
    });
  }

  showFriendlies() async {}

  Widget upcomingFriendliesRow(
      BuildContext context, Icon icon, Text title, Text subtitle, Image map) {
    return new Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: new BoxConstraints.expand(
              height: 150.0,
              width: 150.0,
            ),
            child: Container(
              alignment: Alignment.bottomRight,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: map.image,
                  fit: BoxFit.cover,
                ),
              ),
              child: icon,
            ),
          ),
        ),
        Container(
            child: new Flexible(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            icon,
            Text(
              'Disney Casca ritaaaaaaa aaaaaaaaa aaaaaaaa aaaa aaaaaaa aaaaaa aCas carita aaaaa aaa aaaaaaaa aaaaaaa aaa aaaaaaa aaaaaaaa Cascar itaaaaaa aaaaaaa aaaaaa a aaaaaaaaa aaaaaaaa aaaaa',
              overflow: TextOverflow.ellipsis,
            ),
            subtitle
          ],
        )))
      ],
    ));

    return new ListTile(
      leading: icon,
      title: title,
      subtitle: subtitle,
      onTap: showPlacePicker,
    );

    /*
    return new Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListTile(
          leading: icon,
          title: title,
          subtitle: subtitle,
          onTap: showPlacePicker,
        ),
        map
      ],
    );*/
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_place == null) {
      body = new Center(
        child: new Text('No place picked'),
      );
    } else {
      body = new ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("", style: Theme.of(context).textTheme.display1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Upcoming Friendlies",
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.left,
                ),
              ),
              /*ChoiceCard(
                choice: choices[0],
              ),
              ChoiceCard(
                choice: choices[0],
              ),
              ChoiceCard(
                choice: choices[0],
              ),
              Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    child: Text("More Friendlies"),
                  )),*/
              Container(
                alignment: Alignment.topLeft,
                constraints: new BoxConstraints.expand(
                  height: 150.0,
                  width: 150.0,
                ),
                child: ListTile(
                  leading: const Icon(Sports.golf),
                  title: const Text('Pick-Up Soccer at LP'),
                  subtitle: const Text('Crescent Park'),
                  onTap: showPlacePicker,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                constraints: new BoxConstraints.expand(
                  height: 150.0,
                ),
                child: ListTile(
                  leading: const Icon(Sports.baseball),
                  title: const Text(
                    'Disney Casca ritaaaaaaa aaaaaaaaa aaaaaaaa aaaa aaaaaaa aaaaaa aCas carita aaaaa aaa aaaaaaaa aaaaaaa aaa aaaaaaa aaaaaaaa Cascar itaaaaaa aaaaaaa aaaaaa a aaaaaaaaa aaaaaaaa aaaaa',
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text('Mickey\'s Retreat'),
                  trailing: Image(
                      image: NetworkImage(
                          "https://maps.googleapis.com/maps/api/staticmap?center=Laureate+Park,Orlando,FL&zoom=15&size=150x150&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08")),
                  onTap: showPlacePicker,
                ),
              ),
              Container(
                  child: new SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          elevation: 4.0,
                          child: Text("Load More Friendlies"),
                        ),
                      ))),
              Container(
                  alignment: Alignment.topRight,
                  child: upcomingFriendliesRow(
                      context,
                      const Icon(Sports.baseball),
                      const Text(
                        'Disney Casca ritaaaaaaa aaaaaaaaa aaaaaaaa aaaa aaaaaaa aaaaaa aCas carita aaaaa aaa aaaaaaaa aaaaaaa aaa aaaaaaa aaaaaaaa Cascar itaaaaaa aaaaaaa aaaaaa a aaaaaaaaa aaaaaaaa aaaaa',
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text('Mickey\'s Retreat'),
                      Image(
                          image: NetworkImage(
                              "https://maps.googleapis.com/maps/api/staticmap?center=Laureate+Park,Orlando,FL&zoom=15&size=150x150&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08")))),
              Text('Deliver features faster'),
              new Text(_place.address),
              new Text(_place.name),
              new Text(_place.placeid),
              new Text(_place.location.latitude.toString() +
                  ", " +
                  _place.location.longitude.toString()),
              Text('Craft beautiful UIs'),
            ],
          )
        ],
      );
    }

    return new MaterialApp(
        routes: {
          '/second': (context) => SecondScreen(),
        },
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Nearby Friendly'),
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.map),
                tooltip: 'Find Nearby Friendlies',
                onPressed: showPlacePicker,
              ),
            ],
          ),
          body: body,
          bottomNavigationBar:
              BottomNavigationBar(type: BottomNavigationBarType.fixed, items: <
                  BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                title: new Text(""),
                icon: new IconButton(
                    icon: new ImageIcon(
                        new AssetImage('assets/graphics/001-football.png')))),
            new BottomNavigationBarItem(
                title: new Text(""),
                icon: new IconButton(
                    icon: new ImageIcon(
                        new AssetImage('assets/graphics/001-football.png')))),
            new BottomNavigationBarItem(
                title: new Text(""),
                icon: new IconButton(
                    icon: new ImageIcon(
                        new AssetImage('assets/graphics/001-football.png')))),
            new BottomNavigationBarItem(
                title: new Text(""),
                icon: new IconButton(
                    icon: new ImageIcon(
                        new AssetImage('assets/graphics/001-football.png')))),
          ]),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the Drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: showPlacePicker,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: showPlacePicker,
              child: new IconButton(
                  icon:
                      ImageIcon(AssetImage('assets/graphics/001-football.png')),
                  onPressed: null)),
        ));
  }
}
