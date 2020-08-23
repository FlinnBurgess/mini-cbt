import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String permanenceToggle = 'pessimistic';
  String pervasivenessToggle = 'pessimistic';
  String personalisationToggle = 'pessimistic';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('About the app'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.1, screenHeight * 0.05, screenWidth * 0.1, 0),
          child: Column(
            children: <Widget>[
              Text(
                "This app is based off of the book \"Learned Optimism\".",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "It's purpose is to train your mind to have a more positive explanatory style - the way you describe and explain events that happen around you.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "There are three main characteristics of explanatory style that differentiate optimists from pessimists: "),
              SizedBox(
                height: 35,
              ),
              Text(
                "Permanence",
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              Divider(),
              Text(
                "Is the thing permanent or temporary?",
                textScaleFactor: 1.3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Pessimists tend to think that bad things are permanent while good things are temporary.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: Border.all(color: Colors.black),
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Pessimistic\n(Permanent)",
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () =>
                        setState(() => permanenceToggle = 'pessimistic'),
                    color: permanenceToggle == 'pessimistic'
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                  FlatButton(
                      shape: Border.all(color: Colors.black),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Optimistic\n(Temporary)",
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () =>
                          setState(() => permanenceToggle = 'optimistic'),
                      color: permanenceToggle == 'optimistic'
                          ? Colors.greenAccent
                          : Colors.white),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                permanenceToggle == 'pessimistic'
                    ? '"Skiing is difficult"'
                    : '"The trails were icy today"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                permanenceToggle == 'pessimistic'
                    ? '"My boss is a bastard"'
                    : '"My boss is in a bad mood"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Pervasiveness",
                textScaleFactor: 2,
              ),
              Divider(),
              Text(
                "Does your belief apply to everything or just this one specific example?",
                textScaleFactor: 1.3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Pessimists tend to apply negative beliefs to everything in a category rather than specific instances.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: Border.all(color: Colors.black),
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Pessimistic\n(Universal)",
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () =>
                        setState(() => pervasivenessToggle = 'pessimistic'),
                    color: pervasivenessToggle == 'pessimistic'
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                  FlatButton(
                      shape: Border.all(color: Colors.black),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Optimistic\n(Specific)",
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () =>
                          setState(() => pervasivenessToggle = 'optimistic'),
                      color: pervasivenessToggle == 'optimistic'
                          ? Colors.greenAccent
                          : Colors.white),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                pervasivenessToggle == 'pessimistic'
                    ? '"I\'m repulsive"'
                    : '"I\'m repulsive to him"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                pervasivenessToggle == 'pessimistic'
                    ? '"All teachers are unfair"'
                    : '"This particular teacher is unfair"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Personalisation",
                textScaleFactor: 2,
              ),
              Divider(),
              Text(
                "Is the cause of the problem internal or external?",
                textScaleFactor: 1.3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Pessimists tend to blame themselves for bad events.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: Border.all(color: Colors.black),
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Pessimistic\n(Internal)",
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () =>
                        setState(() => personalisationToggle = 'pessimistic'),
                    color: personalisationToggle == 'pessimistic'
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                  FlatButton(
                      shape: Border.all(color: Colors.black),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Optimistic\n(External)",
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () =>
                          setState(() => personalisationToggle = 'optimistic'),
                      color: personalisationToggle == 'optimistic'
                          ? Colors.greenAccent
                          : Colors.white),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                personalisationToggle == 'pessimistic'
                    ? '"I have no talent in poker"'
                    : '"I have no luck in poker"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                personalisationToggle == 'pessimistic'
                    ? '"I\'m stupid"'
                    : '"You\'re stupid"',
                style: TextStyle(color: Colors.grey),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "This app uses CBT (Cognitive Behavioural Therapy) methods to help you change your explanatory style from negative to positive. It starts by asking you for three things:",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Adversity: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "What happened that you are now thinking about?")
                      ])),
              Text("(e.g. My child didn't do her homework)", textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Belief: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "What are you beliefs about the adversity?")
                      ])),
              Text("(e.g. I am a bad parent)", textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Consequence: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "What did you do or feel in response to these beliefs?")
                      ])),
              Text("(e.g. I felt like I had failed and felt sad for the rest of the day)", textAlign: TextAlign.center,),
              SizedBox(
                height: 30,
              ),
              Text(
                "Next, it will walk you through some exercises which encourage you to challenge and dispute your thoughts:",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Evidence: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "What evidence do you have against your beliefs?")
                      ])),
              Text("(e.g. I spend hours with my child every week teaching her sports and music, I'm not a bad parent)", textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Alternatives: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "What are some alternative, less catastrophic explanations for the adversity?")
                      ])),
              Text("(e.g. I've been very busy at work this week so didn't have the time to check if my child had done her homework)", textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Implications: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "Even if your belief is true, is it really the end of the world? Go back and look for evidence on the contrary.")
                      ])),
              Text("(e.g. Maybe I wasn't the best parent lately. But until recently I've done a really good job making sure she does her homework.)", textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Usefulness: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "Is it worth ruminating about the thought at the moment? Sometimes there's nothing to be gained from keeping the thoughts in your mind. Consider writing the thought down to get it out of your head, or setting a time later in the day to think about it so that you can forget it for now.")
                      ])),
              SizedBox(
                height: 30,
              ),
              Text(
                "The aim is that by giving you an easily accessible tool to guide you through recording your thoughts and feelings when you catch yourself thinking in these ways, you will begin to gradually change your patterns of thought and become more optimistic.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I recommend reading the book \"Learned Optimism\" if you would like to learn about the many benefits of optimistic thinking.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
