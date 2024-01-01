import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';

import '../../../network/remote/dio_helper.dart';
import '../../presentation/screens/business_screen/business_screen.dart';
import '../../presentation/screens/science_screen/science_screen.dart';
import '../../presentation/screens/sports_screen/sports_screen.dart';

class NewsCubit extends Cubit<NewStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '7db944afc8b44133bd742b40eb44fc05',
    }).then((value) {
      // print(value.data['articles'][2]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '7db944afc8b44133bd742b40eb44fc05',
    }).then((value) {
      // print(value.data['articles'][2]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '7db944afc8b44133bd742b40eb44fc05',
    }).then((value) {
      // print(value.data['articles'][2]['title']);
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeAppMode({ bool? fromShared}) {
    if(fromShared!=null){
      isDark=fromShared;
      emit(NewsChangeAppModeState());

    }else {
      isDark = !isDark;
      CacheHelper.putData(key:'isDark', value: isDark).then((value){
        emit(NewsChangeAppModeState());

      });
    }

  }
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {

      'q': '$value',
      'apiKey': '7db944afc8b44133bd742b40eb44fc05',
    }).then((value) {
      // print(value.data['articles'][2]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
