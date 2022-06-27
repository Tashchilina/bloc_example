part of 'bottom_bloc.dart';

@immutable
abstract class BottomEvent {}


class PageTapped extends BottomEvent {
  int index;

  PageTapped(this.index);
}

class ButtonTapped extends BottomEvent {}