import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_event.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{

  SwitchBloc():super( SwitchState()){
    on<ToggleNotification>(_toggleSwitch);
    on<SliderValueChange>(_changeSliderValue);
  }
  
  void _toggleSwitch(ToggleNotification event, Emitter<SwitchState> emit){
   emit(state.copyWith(toggleSwitch: !state.toggleSwitch));
  }

  void _changeSliderValue(SliderValueChange event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.slider));
  }


}