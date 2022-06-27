part of 'bottom_bloc.dart';

@immutable
abstract class BottomState {}

class BottomInitial extends BottomState {}

class FirstPageTapped extends BottomState{
  int counter;

  FirstPageTapped(this.counter);
}

class SecondPageTapped extends BottomState{}