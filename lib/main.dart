import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/network/remote/dio.dart';
import 'package:news_app/shared/bloc_observer/bloc_observer.dart';
import 'package:news_app/shared/consonents/consonents.dart';
import 'package:news_app/shared/cubit.dart';
import 'package:news_app/shared/sharedpreferences/shpref.dart';
import 'package:news_app/shared/states.dart';

import 'news_layout/news_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CachHelper.init();
  bool? isLight = CachHelper.getBrightnessMode(key: "isLight");
  Bloc.observer = MyBlocObserver();

  runApp( MyApp(isModeLight: isLight));
}

class MyApp extends StatelessWidget {
  bool? isModeLight;
   MyApp({required this.isModeLight});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..changeBrightnessMode(isLightMode:isModeLight )..getBussiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = BlocProvider.of<NewsCubit>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            themeMode: cubit.isLight? ThemeMode.light:ThemeMode.dark,
            theme: ThemeData(
                textTheme: TextTheme(
                  bodyLarge:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  bodyMedium: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.black87,
                    elevation: 20.0,
                    showUnselectedLabels: true),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    //statusBarBrightness: Brightness.light,
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                  titleSpacing: 10.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900),
                  color: Colors.white,
                  elevation: 0.0,
                )),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  bodyMedium: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333734'),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    showUnselectedLabels: true),
                scaffoldBackgroundColor: HexColor('333734'),
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333734'),
                    statusBarIconBrightness: Brightness.light,
                    //statusBarBrightness: Brightness.light,
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                  titleSpacing: 10.0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900),
                  color: HexColor('333734'),
                  elevation: 0.0,
                )),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
