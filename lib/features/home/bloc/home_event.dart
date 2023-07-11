part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitailEvent extends HomeEvent {}

class HomeChangePageEvent extends HomeEvent {
  final int pageIndex;
  HomeChangePageEvent({required this.pageIndex});
}
