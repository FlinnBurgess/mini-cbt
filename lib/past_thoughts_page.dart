import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'thoughts.dart';

class PastThoughtsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Thoughts'),
      ),
      body: Consumer<Thoughts>(builder: (context, thoughts, _) {
        return ListView.builder(
            itemCount: thoughts.thoughts.length,
            itemBuilder: (context, index) => asCard(
                thoughts.thoughts[index],
                () => _showDeleteThoughtConfirmation(
                    context, thoughts, thoughts.thoughts[index])));
      }),
    );
  }

  Widget asCard(Map thought, Function deleteThought) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Stack(alignment: Alignment.center, children: [
          Card(
            elevation: 3,
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Adversity',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                    Text(thought['adversity'], textScaleFactor: 1.2),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Belief',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.red[600]),
                    ),
                    Text(thought['belief'], textScaleFactor: 1.2),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Consequence',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.red[600]),
                    ),
                    Text(thought['consequence'], textScaleFactor: 1.2),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Contradicting Evidence',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.green[600]),
                    ),
                    Text(thought['evidence'], textScaleFactor: 1.2),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Alternative Explanations',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.green[600]),
                    ),
                    Text(thought['alternatives'], textScaleFactor: 1.2),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'True Implications',
                      textScaleFactor: 1.6,
                      style: TextStyle(color: Colors.green[600]),
                    ),
                    Text(thought['implications'], textScaleFactor: 1.2),
                  ],
                )),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              color: Colors.red[800],
              onPressed: deleteThought,
              icon: Icon(Icons.delete),
            ),
          ),
        ]));
  }

  void _showDeleteThoughtConfirmation(context, Thoughts thoughts, Map thought) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Delete thought?'),
              content: Text(
                  "You can't recover a thought once it is deleted. Are you sure?"),
              actions: <Widget>[
                FlatButton(
                  color: Colors.red[800],
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    thoughts.deleteThought(thought);
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
