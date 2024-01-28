import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsadoption/features/home/ui/homePage.dart';
import 'package:petsadoption/features/themeMode/bloc/theme_bloc.dart';

  class ThemeChanger extends StatelessWidget {
    const ThemeChanger({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<ThemeBloc, ThemeData>(
        bloc: ThemeBloc(),
        builder: (context, state) {
          return MaterialApp(
            theme: state,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      );
    }
  }
