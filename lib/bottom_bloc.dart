import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_event.dart';
part 'bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {

  int index = 0;
  int counter = 0;

  BottomBloc() : super(FirstPageTapped(0)) {
    on<BottomEvent>((event, emit) {
      if(event is PageTapped) {
        index = event.index;
        if(index ==0) {
          emit (FirstPageTapped(counter));
        }else if(index==1){
          emit(SecondPageTapped());
        }
      }
      else if(event is ButtonTapped){
        counter++;
        emit(FirstPageTapped(counter));
      }
    });
  }
}
