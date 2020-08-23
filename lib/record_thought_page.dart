import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'thoughts.dart';

class RecordThoughtPage extends StatefulWidget {
  @override
  _RecordThoughtPageState createState() => _RecordThoughtPageState();
}

class _RecordThoughtPageState extends State<RecordThoughtPage> {
  String currentTextInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record a new thought'),
      ),
      body: Consumer<Thoughts>(builder: (context, thoughts, _) {
        currentTextInput = thoughts.getCurrentValue();
        TextEditingController controller = TextEditingController();
        controller.value =
            TextEditingValue(text: thoughts.getCurrentValue() ?? '');

        return SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Text(
                          titles[thoughts.currentStage]['title'],
                          textScaleFactor: 3,
                          textAlign: TextAlign.center,
                        )),
                    Divider(),
                    Text(
                      titles[thoughts.currentStage]['subtitle'],
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: SingleChildScrollView(
                              child: Text(
                            titles[thoughts.currentStage]['explanation'],
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ))),
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    minLines: 3,
                    maxLines: null,
                    onChanged: (value) => currentTextInput = value,
                    controller: controller,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: thoughts.currentStage == Stage.ADVERSITY
                              ? Container()
                              : IconButton(
                                  onPressed: () {
                                    thoughts.setCurrentValue(currentTextInput);

                                    setState(() {
                                      thoughts.currentStage = stageProgressions[
                                          thoughts.currentStage]['previous'];
                                    });
                                  },
                                  icon: Icon(Icons.chevron_left),
                                  iconSize: 40,
                                )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: IconButton(
                            color: thoughts.currentStage == Stage.USEFULNESS
                                ? Colors.green[300]
                                : Colors.black,
                            onPressed: () {
                              thoughts.setCurrentValue(currentTextInput);

                              if (thoughts.currentStage == Stage.USEFULNESS) {
                                thoughts.saveThought();
                                Navigator.of(context).pop();
                              } else {
                                setState(() {
                                  thoughts.currentStage =
                                      stageProgressions[thoughts.currentStage]
                                          ['next'];
                                });
                              }
                            },
                            icon: Icon(thoughts.currentStage == Stage.USEFULNESS
                                ? Icons.check
                                : Icons.chevron_right),
                            iconSize: 40,
                          )),
                    ],
                  )),
            ],
          )),
        );

//        return Center(
//            child: CustomScrollView(slivers: [
//          SliverFillRemaining(
//              hasScrollBody: false,
//              child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Expanded(child: Container()),
//                      Padding(
//                          padding: EdgeInsets.only(
//                              top: MediaQuery.of(context).size.height * 0.05),
//                          child: Text(
//                            titles[thoughts.currentStage]['title'],
//                            textScaleFactor: 3,
//                            textAlign: TextAlign.center,
//                          )),
//                      Divider(),
//                      Text(
//                        titles[thoughts.currentStage]['subtitle'],
//                        textScaleFactor: 1.5,
//                        textAlign: TextAlign.center,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: MediaQuery.of(context).size.height * 0.03),
//                        child: Text(
//                          titles[thoughts.currentStage]['explanation'],
//                          style: TextStyle(color: Colors.grey),
//                          textAlign: TextAlign.center,
//                        ),
//                      ),
//                      Expanded(
//                        child: Container(),
//                      ),
//                      SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
//                      Container(
//                          width: MediaQuery.of(context).size.width * 0.9,
//                          child: TextField(
//                            decoration: InputDecoration(
//                                border: OutlineInputBorder(
//                                    borderSide:
//                                        BorderSide(color: Colors.black54)),
//                                focusedBorder: OutlineInputBorder(
//                                    borderSide:
//                                        BorderSide(color: Colors.black))),
//                            minLines: 3,
//                            maxLines: null,
//                            onChanged: (value) => currentTextInput = value,
//                            controller: controller,
//                          )),
//                      Padding(
//                          padding: EdgeInsets.only(
//                              bottom:
//                                  MediaQuery.of(context).size.height * 0.05),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.3,
//                                  child: thoughts.currentStage ==
//                                          Stage.ADVERSITY
//                                      ? Container()
//                                      : IconButton(
//                                          onPressed: () {
//                                            thoughts.setCurrentValue(
//                                                currentTextInput);
//
//                                            setState(() {
//                                              thoughts.currentStage =
//                                                  stageProgressions[
//                                                          thoughts.currentStage]
//                                                      ['previous'];
//                                            });
//                                          },
//                                          icon: Icon(Icons.chevron_left),
//                                          iconSize: 40,
//                                        )),
//                              Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.3,
//                                  child: IconButton(
//                                    color: thoughts.currentStage ==
//                                            Stage.USEFULNESS
//                                        ? Colors.green[300]
//                                        : Colors.black,
//                                    onPressed: () {
//                                      thoughts
//                                          .setCurrentValue(currentTextInput);
//
//                                      if (thoughts.currentStage ==
//                                          Stage.USEFULNESS) {
//                                        thoughts.saveThought();
//                                        Navigator.of(context).pop();
//                                      } else {
//                                        setState(() {
//                                          thoughts.currentStage =
//                                              stageProgressions[thoughts
//                                                  .currentStage]['next'];
//                                        });
//                                      }
//                                    },
//                                    icon: Icon(thoughts.currentStage ==
//                                            Stage.USEFULNESS
//                                        ? Icons.check
//                                        : Icons.chevron_right),
//                                    iconSize: 40,
//                                  )),
//                            ],
//                          )),
//                    ],
//                  )))
//        ]));
      }),
    );
  }
}

enum Stage {
  ADVERSITY,
  BELIEF,
  CONSEQUENCE,
  EVIDENCE,
  ALTERNATIVES,
  IMPLICATIONS,
  USEFULNESS
}

const Map<Stage, Map> titles = {
  Stage.ADVERSITY: {
    'title': 'Adversity',
    'subtitle': 'What happened that you are now thinking about?',
    'explanation': '"I had an argument with my partner."'
  },
  Stage.BELIEF: {
    'title': 'Belief',
    'subtitle': 'What are your beliefs about the adversity?',
    'explanation': '"I am unlovable."'
  },
  Stage.CONSEQUENCE: {
    'title': 'Consequence',
    'subtitle': 'What did you do/feel in response to these beliefs?',
    'explanation':
        '"I spent the evening ignoring my partner and feeling bad about myself."'
  },
  Stage.EVIDENCE: {
    'title': 'Evidence',
    'subtitle': 'What evidence do you have against your beliefs?',
    'explanation':
        'For example if your belief is that you are unlovable, you might note all the times ' +
            'your partner has told you they love you, or the acts of kindness they do for you on a day to day basis.'
  },
  Stage.ALTERNATIVES: {
    'title': 'Alternative Explanations',
    'subtitle': 'What less catastrophic explanations are there?',
    'explanation': 'Things don’t tend to have just a single cause. ' +
        'Focus on the possible explanations which are changeable: "My partner and I have both been getting less sleep than we need, so we are both grouchy."'
  },
  Stage.IMPLICATIONS: {
    'title': 'Implications',
    'subtitle':
        'Even if your belief is true, is it really the end of the world?',
    'explanation':
        "Your first conclusion is likely to be blown out of proportion. Just because your partner didn't love you in the heat of argument, " +
            "does it really mean you are unlovable? Even if they don't love you, does that prove that nobody does, or ever will? Look for contradicting evidence again."
  },
  Stage.USEFULNESS: {
    'title': 'Usefulness',
    'subtitle': 'Is it worth ruminating about the thought at the moment?',
    'explanation':
        "Whether or not the belief is accurate, is it useful to hold it in your mind? What do you accomplish by ruminating on it? Consider setting a time to come " +
            "back to the thought later, or write the thought down to get it out of your head."
  },
};

const Map<Stage, Map<String, Stage>> stageProgressions = {
  Stage.ADVERSITY: {'next': Stage.BELIEF, 'previous': Stage.ADVERSITY},
  Stage.BELIEF: {'next': Stage.CONSEQUENCE, 'previous': Stage.ADVERSITY},
  Stage.CONSEQUENCE: {'next': Stage.EVIDENCE, 'previous': Stage.BELIEF},
  Stage.EVIDENCE: {'next': Stage.ALTERNATIVES, 'previous': Stage.CONSEQUENCE},
  Stage.ALTERNATIVES: {'next': Stage.IMPLICATIONS, 'previous': Stage.EVIDENCE},
  Stage.IMPLICATIONS: {
    'next': Stage.USEFULNESS,
    'previous': Stage.ALTERNATIVES
  },
  Stage.USEFULNESS: {'next': null, 'previous': Stage.IMPLICATIONS}
};
