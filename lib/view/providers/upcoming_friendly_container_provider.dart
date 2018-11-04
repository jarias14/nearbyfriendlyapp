import 'package:flutter/material.dart';
import 'package:nearbyfriendlyapp/models/match.dart';

class UpcomingFriendlyContainerProvider {
  static Widget provide(BuildContext context, NearbyFriendlyMatch match) {
    return new Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: new BoxConstraints.expand(
              height: 120.0,
              width: 150.0,
            ),
            child: Container(
              alignment: Alignment.bottomRight,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: match.image.image,
                  fit: BoxFit.cover,
                ),
              ),
              child: match.icon,
            ),
          ),
        ),
        Container(
            child: new Flexible(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row ( children: <Widget>[match.icon, Text("6PM Sunday 10/12")]),
            Text(
              match.title,
              overflow: TextOverflow.ellipsis,
            ),
            Text(match.players)
          ],
        )))
      ],
    ));
  }
}
