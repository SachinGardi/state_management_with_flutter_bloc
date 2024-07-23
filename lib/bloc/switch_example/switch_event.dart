import 'package:equatable/equatable.dart';

 abstract class SwitchEvent extends Equatable{

  const SwitchEvent();
  @override
  List<Object?> get props => [];

}

class ToggleNotification extends SwitchEvent{}

class SliderValueChange extends SwitchEvent{
  double slider;
  SliderValueChange({required this.slider});
  @override
  List<Object?> get props => [slider];
}
