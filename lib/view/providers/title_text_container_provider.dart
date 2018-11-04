import 'package:flutter/material.dart';

class TitleTextContainerProvider {

  static Widget provide(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, top: 32.0, right: 16.0, bottom: 16.0),
      child: new Text(
        title,
        style: Theme.of(context).textTheme.display1,
        textAlign: TextAlign.left,
      ),
    );
  }

}