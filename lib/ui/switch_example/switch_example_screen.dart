import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_event.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_state.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch and slider with bloc'),
        centerTitle: true,
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.toggleSwitch != current.toggleSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.toggleSwitch, onChanged: (value) {
                      context.read<SwitchBloc>().add(ToggleNotification());
                    },);
                  },
                )
              ],
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            const SizedBox(height: 50,),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  min: 0,
                  max: 1,
                  value: state.sliderValue, onChanged: (value) {
                  context.read<SwitchBloc>().add(
                      SliderValueChange(slider: value));
                },);
              },
            )
          ],
        ),
      ),
    );
  }
}
