import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{

  bool toggleSwitch;
  double sliderValue;
  SwitchState({this.toggleSwitch = true,this.sliderValue = 0.5});

  SwitchState copyWith({bool? toggleSwitch, double? sliderValue}){
    return SwitchState(toggleSwitch: toggleSwitch?? this.toggleSwitch,sliderValue: sliderValue??this.sliderValue);
  }

  @override
  List<Object?> get props => [toggleSwitch,sliderValue];

}