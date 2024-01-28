import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:petsadoption/features/themeMode/theme_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

void initState (){
  
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.dark()) {
on<InitialThemeSetEvent>((event, emit)  {
    //print("asfd");
    final bool hasDarkTheme = true;
    if (hasDarkTheme) {
      emit(ThemeData.dark());
    } 
  });

            //while switch is clicked
      on<ThemeSwitchEvent>((event, emit) {
        final isDark = state == ThemeData.dark();

        emit(isDark ? ThemeData.light() : ThemeData.dark());
        setTheme(isDark);
      });
  }
}
