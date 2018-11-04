import 'package:flutter/material.dart';

class BodyButtonProvider {
  static Widget provide(BuildContext context, String title, VoidCallback onPressed) {
    return Container(
        child: new SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                child: Text(title),
                onPressed: onPressed,
              ),
            )));
  }
}
