import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mini_cbt/record_thought_page.dart';
import 'package:path_provider/path_provider.dart';

class Thoughts extends ChangeNotifier {
  List<Map> _thoughts = [];
  String _currentAdversity = '';
  String _currentBelief = '';
  String _currentConsequence = '';
  String _currentEvidence = '';
  String _currentAlternatives = '';
  String _currentImplications = '';
  String _currentUsefulness = '';
  Stage currentStage = Stage.ADVERSITY;
  bool thoughtInProgress = false;

  List get thoughts => _thoughts;

  Thoughts();

  Thoughts.fromDetails(
      this._thoughts,
      this._currentAdversity,
      this._currentBelief,
      this._currentConsequence,
      this._currentEvidence,
      this._currentAlternatives,
      this._currentImplications,
      this.thoughtInProgress);

  void saveThought() {
    _thoughts.insert(0, {
      'adversity': _currentAdversity,
      'belief': _currentBelief,
      'consequence': _currentConsequence,
      'evidence': _currentEvidence,
      'alternatives': _currentAlternatives,
      'implications': _currentImplications,
    });

    save();
    resetCurrentThought();
  }

  String getCurrentValue() {
    switch (currentStage) {
      case Stage.ADVERSITY:
        return _currentAdversity;
      case Stage.BELIEF:
        return _currentBelief;
      case Stage.CONSEQUENCE:
        return _currentConsequence;
      case Stage.EVIDENCE:
        return _currentEvidence;
      case Stage.ALTERNATIVES:
        return _currentAlternatives;
      case Stage.IMPLICATIONS:
        return _currentImplications;
      case Stage.USEFULNESS:
        return _currentUsefulness;
      default:
        return '';
    }
  }

  void setCurrentValue(String value) {
    switch (currentStage) {
      case Stage.ADVERSITY:
        _currentAdversity = value;
        break;
      case Stage.BELIEF:
        _currentBelief = value;
        break;
      case Stage.CONSEQUENCE:
        _currentConsequence = value;
        break;
      case Stage.EVIDENCE:
        _currentEvidence = value;
        break;
      case Stage.ALTERNATIVES:
        _currentAlternatives = value;
        break;
      case Stage.IMPLICATIONS:
        _currentImplications = value;
        break;
      case Stage.USEFULNESS:
        _currentUsefulness = value;
        break;
    }

    thoughtInProgress = true;
    save();

    notifyListeners();
  }

  void resetCurrentThought() {
    currentStage = Stage.ADVERSITY;
    _currentAdversity = '';
    _currentBelief = '';
    _currentConsequence = '';
    _currentEvidence = '';
    _currentAlternatives = '';
    _currentImplications = '';
    _currentUsefulness = '';
    thoughtInProgress = false;

    notifyListeners();
  }

  void deleteThought(Map thought) {
    _thoughts.remove(thought);
    save();
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> asJson = {};
    asJson['thoughts'] = _thoughts;
    asJson['thoughtInProgress'] = thoughtInProgress;
    asJson['adversity'] = _currentAdversity;
    asJson['belief'] = _currentBelief;
    asJson['consequence'] = _currentConsequence;
    asJson['evidence'] = _currentEvidence;
    asJson['alternatives'] = _currentAlternatives;
    asJson['implications'] = _currentImplications;
    return asJson;
  }

  static List<Map> fromJson(List thoughts) {
    return thoughts.map((thought) => Map.from(thought)).toList();
  }

  static Future<Thoughts> load() async {
    try {
      final file = await _localFile;
      String encodedThoughts = await file.readAsString();
      Map<String, dynamic> decoded = jsonDecode(encodedThoughts);

      return Thoughts.fromDetails(
          fromJson(decoded['thoughts']),
          decoded['adversity'],
          decoded['belief'],
          decoded['consequence'],
          decoded['evidence'],
          decoded['alternatives'],
          decoded['implications'],
          decoded['thoughtInProgress']);
    } catch (error) {
      print('Something went wrong while loading your thoughts: $error');
      return Thoughts();
    }
  }

  Future<void> save() async {
    try {
      final file = await _localFile;
      return file.writeAsString(jsonEncode(this.toJson()));
    } catch (e) {
      print('Error saving thoughts: $e');
    }
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/thoughts.json');
  }
}
