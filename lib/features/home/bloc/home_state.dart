part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int? pageIndex;
  const HomeState(
    this.pageIndex,
  );
}

class MainInitialState extends HomeState {
  const MainInitialState() : super(0);
}

class MainPageIndexState extends HomeState {
  const MainPageIndexState(int? pageIndex) : super(pageIndex);
}
