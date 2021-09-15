import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookstore/dataset/book.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(readList: <Book>[]));

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is AddToListEvent) {
      yield MainState(readList: <Book>[])..readList.add(event.book);
    } else if (event is RemoveFromListEvent) {
      yield MainState(readList: <Book>[])..readList.remove(event.book);
    }
  }
}
