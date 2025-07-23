part of 'home_layout_cubit.dart';

@immutable
sealed class HomeLayoutState {
  Widget getWidget();
}

final class HomeScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return const HomeScreen();
  }
}
