import 'package:flutter/material.dart';
import 'package:mini_cbt/about_page.dart';
import 'package:mini_cbt/past_thoughts_page.dart';
import 'package:mini_cbt/record_thought_page.dart';
import 'package:mini_cbt/support_me_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<Thoughts>(builder: (context, thoughts, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  if (thoughts.thoughtInProgress) {
                    _showDeleteCurrentThoughtConfirmation(context, thoughts);
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RecordThoughtPage()));
                  }
                },
                child: SizedBox(
                    width: 165,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Record a new thought',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ))),
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: thoughts.thoughtInProgress
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RecordThoughtPage()));
                        }
                      : null,
                  disabledColor: Colors.grey[300],
                  child: SizedBox(
                      width: 165,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Finish thought in progress',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.3,
                      )))),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PastThoughtsPage())),
                child: SizedBox(
                    width: 165,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Past thoughts',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ))),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AboutPage())),
                child: SizedBox(
                    width: 165,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Learn more',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ))),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SupportMePage())),
                child: SizedBox(
                    width: 165,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Support the developer',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ))),
              ),
            ].where((element) => element != null).toList(),
          );
        }),
      ),
    );
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
}
