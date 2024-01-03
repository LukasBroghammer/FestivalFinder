import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

///-------------------------------------------------------------------------------------------------------------------
/// the base bloc of any widget, that allows to move, select, identify
/// the widget etc. all widgets should implement a bloc that extends this.
///-------------------------------------------------------------------------------------------------------------------
class IbsWidgetBloc {
  /// The global key of the widget. With this key it is unique and we can determine
  /// it's global size and position at any time.
  GlobalKey? key;

  /// this is the current active state of a widget that is initialized by the
  /// stored state from oDB.widgets["state"]. To be able to save the state
  /// permanently ist has to be written to oDB.widgets["state"].
  Map<String, dynamic> state = {};

  PublishSubject<Map<String, dynamic>> subject = PublishSubject<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get stream => subject.stream;

  IbsWidgetBloc({required Map<String, dynamic> initial}) {
    state = initial;
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// just updates the widget by sinking the bloc state. the stored state in oDB.widgets is untouched.
  ///-------------------------------------------------------------------------------------------------------------------
  void update() {
    // stream the new state
    subject.sink.add(state);
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// disposes the widget
  ///-------------------------------------------------------------------------------------------------------------------
  void dispose() {
    subject.close();
  }
}
