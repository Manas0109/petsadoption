import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsadoption/features/home/bloc/home_bloc.dart';
import 'package:petsadoption/features/themeMode/bloc/theme_bloc.dart';
import 'package:petsadoption/features/themeMode/ui/theme.dart';

     void main() {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (BuildContext context) => HomeBloc(),
            ),
            BlocProvider<ThemeBloc>(
              create: (BuildContext context) => ThemeBloc(),
            ),
          ],
          child: MyApp(),
        ),
      );
    }
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter MultiblocProvider',
          home: ThemeChanger(),
        );
      }
    }

