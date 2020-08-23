import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Support the developer'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              direction: Axis.vertical,
              spacing: 25,
              children: <Widget>[
                Container(
                    width: 300,
                    child: Text(
                        'Hi! Thanks for using Mini CBT. If you are finding the app useful and would like to support me, here are some ways you can do that',
                        textAlign: TextAlign.center)),
                Container(
                    width: 300,
                    child: Center(
                        child: RaisedButton(
                          child: Text('Buy me a coffee'),
                          onPressed: () =>
                              launch('https://www.buymeacoffee.com/flinnburgess'),
                        ))),
                Container(
                    width: 300,
                    child: Center(
                        child: RaisedButton(
                          child: Text('Rate the app'),
                          onPressed: () => launch(
                              'https://play.google.com/store/apps/details?id=com.flinnburgess.gloomhaven_deck_tracker'),
                        ))),
                Container(
                    width: 300,
                    child: Text(
                        'If you spot any bugs or have suggestions for how I can improve the app, feel free to contact me at flinn@thetimelydeveloper.com',
                        textAlign: TextAlign.center)),
              ],
            ),
          ],
        ));
  }
}
