
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';

class PlacePicker extends State<StatefulWidget> {

  @override
  void initState() {
    super.initState();
    FlutterPlacesDialog.setGoogleApiKey(
        "AIzaSyDchsGIuFa-LRvTvqlY9-NwNplYG1fmQ08");
  }

  @override
  Widget build(BuildContext context) {

  }

  PlacePicker(this.context);

  final BuildContext context;

  showPlacePicker() async {
    PlaceDetails place;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await FlutterPlacesDialog.getPlacesDialog();
    } on PlatformException {
      place = null;
    }

  }



}