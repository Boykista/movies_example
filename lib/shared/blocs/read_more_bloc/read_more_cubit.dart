import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_example/shared/blocs/read_more_bloc/read_more_state.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/utils/utils.dart';

class ReadMoreCubit extends Cubit<ReadMoreState> {
  final int maxLines;
  final utils = locator<Utils>();

  ReadMoreCubit({required this.maxLines})
      : super(ReadMoreState(maxLines: maxLines));

  void readMore() {
    emit(ReadMoreState(isTextExpanded: true, maxLines: null));
  }

  void readLess() {
    emit(ReadMoreState(isTextExpanded: false, maxLines: maxLines));
  }

  void toggleMoreLess() {
    if (state.isTextExpanded) {
      readLess();
    } else {
      readMore();
    }
  }

  bool isTextOverflown(
    String text, {
    required double maxWidth,
    required TextScaler textScaler,
    required TextStyle style,
  }) {
    return utils.hasTextOverflown(
      text,
      maxLines: maxLines,
      maxWidth: maxWidth,
      textScaler: textScaler,
      style: style,
    );
  }
}
