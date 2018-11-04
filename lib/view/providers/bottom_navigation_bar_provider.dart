import 'package:flutter/material.dart';

class BottomNavigationBarProvider {
  static BottomNavigationBar provide() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
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
        ]);
  }
}
