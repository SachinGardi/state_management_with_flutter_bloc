import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_state_management/ui/imagePicker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (BuildContext context) => CounterBloc(),),
        BlocProvider<SwitchBloc>(create: (BuildContext context) => SwitchBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}

