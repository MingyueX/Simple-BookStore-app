part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class AddToListEvent extends MainEvent {
  final Book book;
  const AddToListEvent({required this.book});

  @override
  List<Object> get props => [book];
}

class RemoveFromListEvent extends MainEvent {
  final Book book;
  const RemoveFromListEvent({required this.book});

  @override
  List<Object> get props => [book];
}
