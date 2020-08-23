import 'package:flutter/material.dart';
import 'package:mini_cbt/about_page.dart';
import 'package:mini_cbt/past_thoughts_page.dart';
import 'package:mini_cbt/record_thought_page.dart';
import 'package:mini_cbt/thoughts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Thoughts thoughts = await Thoughts.load();

  runApp(ChangeNotifierProvider(
    create: (_) => thoughts,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini CBT',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mini CBT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showDeleteCurrentThoughtConfirmation(context, Thoughts thoughts) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text('Overwrite existing thought?'),
              content: Text(
                  'This will overwrite the thought currently in progress. It will not be saved. Continue?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Colors.red[800],
                ),
                FlatButton(
                  child: Text('Continue'),
                  onPressed: () {
                    thoughts.resetCurrentThought();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RecordThoughtPage()));
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<Thoughts>(builder: (context, thoughts, _) {
          return Column(
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  if (thoughts.thoughtInProgress) {
                    _showDeleteCurrentThoughtConfirmation(context, thoughts);
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RecordThoughtPage()));
                  }
                },
                child: Text('Record a new thought'),
              ),
              RaisedButton(
                  onPressed: thoughts.thoughtInProgress
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RecordThoughtPage()));
                        }
                      : null,
                  child: Text('Finish the thought in progress')),
              RaisedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PastThoughtsPage())),
                child: Text('Past thoughts'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AboutPage())),
                child: Text('About'),
              ),
            ].where((element) => element != null).toList(),
          );
        }),
      ),
    );
  }
}
