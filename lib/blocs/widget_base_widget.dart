// ignore: must_be_immutable
import 'package:festival/Utils/DatabaseService.dart';
import 'package:festival/blocs/widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// the base state of any widget, that allows to move, select, identify
/// the widget etc. all widgets states should inherit this base state
class IbsBaseState {
  String? uuid; // the uuid of the widget
  String? name;
  String? type; // the widget type (class)

  IbsBaseState({
    this.uuid,
    this.name,
    this.type,
  }) {
    uuid = uuid ?? Uuid().v4();
    type = type ?? "";
    name = name ?? "";
  }
}

// ignore: must_be_immutable
class IbsStatelessWidget extends StatelessWidget {
  // the widgets state
  Map<String, dynamic> state = {};
  // the widgets BLOC
  IbsWidgetBloc bloc = IbsWidgetBloc(initial: {});
  // the border color in edit mode

  // unnamed constructor
  IbsStatelessWidget({Key? key}) : super(key: key);

  // named constructor
  IbsStatelessWidget.state({Key? key, required Map<String, dynamic> state}) : super(key: key) {
    state = state;
  }

  ///-------------------------------------------------------------------------------------------------------------------
  // state initialization
  ///-------------------------------------------------------------------------------------------------------------------
  void initState({
    GlobalKey? key,
    required dynamic state,
  }) {
    bloc = IbsWidgetBloc(initial: state);
    bloc.key = key;
    oDB.blocs[bloc.state["uuid"]] = bloc;
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// the state update function that should be overridden by the user
  ///-------------------------------------------------------------------------------------------------------------------
  void updateState(Map<String, dynamic>? state) {
    state = state;
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// the widget building function that should be overridden by the user
  ///-------------------------------------------------------------------------------------------------------------------
  Widget buildWidget({
    required BuildContext context,
  }) {
    return Container();
  }

  ///-------------------------------------------------------------------------------------------------------------------
  ///
  ///-------------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<Map<String, dynamic>> state) {
        // set the new widget state
        if (state.hasData) {
          updateState(state.data);
        }

        return buildWidget(
          context: context,
        );
      },
    );
  }
}
