import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:nearbyfriendlyapp/view/icons/sports_icons.dart';
import 'package:nearbyfriendlyapp/models/match.dart';
import 'package:nearbyfriendlyapp/view/providers/bottom_navigation_bar_provider.dart';
import 'package:nearbyfriendlyapp/view/providers/title_text_container_provider.dart';
import 'package:nearbyfriendlyapp/view/providers/body_button_provider.dart';
import 'package:nearbyfriendlyapp/view/providers/upcoming_friendly_container_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();

}


class _MyAppState extends State<MyApp> {
  //PlacePicker placePicker = new PlacePicker(State);
  PlaceDetails _place;
  List<NearbyFriendlyMatch> matches = generateMatches();

  @override
  void initState() {
    super.initState();
    FlutterPlacesDialog.setGoogleApiKey(
        "AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08");
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

  static List<NearbyFriendlyMatch> generateMatches() {
    return <NearbyFriendlyMatch>[
      NearbyFriendlyMatch(
          icon: const Icon(Sports.baseball),
          image: Image(
              image: NetworkImage(
                  "https://maps.googleapis.com/maps/api/staticmap?center=Laureate+Park,Orlando,FL&zoom=15&size=120x150&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08")),
          title: "The First Title",
          players: "Zizou, Ronaldo, Figo, Helguera, Casillas, Kempes, Tejada",
          location: "123 Some Google loc, Orlando, FL 32827"),
      NearbyFriendlyMatch(
          icon: const Icon(Sports.soccer),
          image: Image(
              image: NetworkImage(
                  "https://maps.googleapis.com/maps/api/staticmap?center=Laureate+Park,Orlando,FL&zoom=15&size=120x150&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08")),
          title: "The First Title",
          players: "Zizou, Ronaldo, Figo, Helguera, Casillas, Kempes, Tejada",
          location: "123 Some Google loc, Orlando, FL 32827"),
      NearbyFriendlyMatch(
          icon: const Icon(Sports.cricket),
          image: Image(
              image: NetworkImage(
                  "https://maps.googleapis.com/maps/api/staticmap?center=Laureate+Park,Orlando,FL&zoom=15&size=120x150&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08")),
          title: "The First Title",
          players: "Zizou, Ronaldo, Figo, Helguera, Casillas, Kempes, Tejada",
          location: "123 Some Google loc, Orlando, FL 32827")
    ];
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
              TitleTextContainerProvider.provide(context, "Upcoming Friendlies"),
              UpcomingFriendlyContainerProvider.provide(context, matches[0]),
              UpcomingFriendlyContainerProvider.provide(context, matches[1]),
              UpcomingFriendlyContainerProvider.provide(context, matches[2]),
              BodyButtonProvider.provide(context, "Load More Upcoming Friendlies", null),
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
          '/second': (context) => showPlacePicker(),
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
          bottomNavigationBar: BottomNavigationBarProvider.provide(),
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
