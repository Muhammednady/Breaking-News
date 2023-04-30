import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remote/dio.dart';
import 'package:news_app/shared/sharedpreferences/shpref.dart';
import 'package:news_app/shared/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/bussiness_screen/bussiness.dart';
import '../modules/science_screen/science.dart';
import '../modules/settings_screen/settings_screen.dart';
import '../modules/sports_screen/sports.dart';
import 'consonents/consonents.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  int itemIndex = 0;
  bool isLight = false;
  // bool isLight = isModeLight == null ? true : isModeLight! ;
  // bool isLight = isModeLight ?? true ;
  List<Widget> screens = <Widget>[
    BussinesSCreen(),
    SportsSCreen(),
    SCienceScreen(),
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  static NewsCubit get(BuildContext context) =>
      BlocProvider.of<NewsCubit>(context);

  void change(int value) {
    itemIndex = value;
    emit(NewsBottomNavChangeState());
  }

  void changeBrightnessMode({bool? isLightMode}) {
    if (isLightMode != null) {
      isLight = isLightMode;
    } else {
      isLight = !isLight;
    }

    CachHelper.setBrightnessMode(key: "isLight", isLight: isLight)
        .then((value) {
      emit(NewsBrightnessModeChangeState());
    });
  }

  void getBussiness() {
    emit(NewsGetBussinessLoadingState());

    DioHelper.getData(Url: "v2/top-headlines", query: {
      "country": "us",
      "category": "business",
      "apikey": "1fc3251744b7455582ee5f009e3b0b58"
    }).then((value) {
      business = value.data['articles'];
      //  List<Map> = List<dynamic>
      print('===================business==============');
      print(business);
      emit(NewsGetBussinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBussinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(Url: "v2/top-headlines", query: {
        "country": "us",
        "category": "sports",
        "apikey": "1fc3251744b7455582ee5f009e3b0b58"
      }).then((value) {
        sports = value.data['articles'];
        print('===================sports==============');
        print(sports);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(Url: "v2/top-headlines", query: {
        "country": "us",
        "category": "science",
        "apikey": "1fc3251744b7455582ee5f009e3b0b58"
      }).then((value) {
        science = value.data['articles'];
        print('===================science==============');
        print(science);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch({required String param}) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(Url: "v2/everything", query: {
      "q": "${param}",
      "apikey": "1fc3251744b7455582ee5f009e3b0b58"
    }).then((value) {
      search = value.data['articles'];
      //  List<Map> = List<dynamic>///this line : Makes Error//
      print('===================search==============');
      print(search);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}

/*
.catchError((error){
      print('error while set in sharedPreferences :$error');

      emit(NewsBrightnessModeChangeState());
     })
     */