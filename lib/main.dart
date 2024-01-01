import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/business_logic/cubit/cubit.dart';
import 'package:news_app/network/local/cache_helper.dart';

import 'business_logic/bloc_observer.dart';
import 'business_logic/cubit/states.dart';
import 'layout/news_layout.dart';

import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.int();
  bool? isDark = CacheHelper.getData(key: 'isDark')??false;
  runApp( NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool isDark;
  const NewsApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context,) => NewsCubit()..getScience()..getSports()..getBusiness()

        ..changeAppMode(
          fromShared: isDark
        ),
      child: BlocConsumer<NewsCubit, NewStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            theme: ThemeData( cardTheme: CardTheme(
              color: Colors.white,
              shadowColor:Colors.grey.shade400

            ),
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.teal,
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white),
                    centerTitle: true,
                    titleTextStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.red),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    backgroundColor: Colors.white),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black))),
            darkTheme: ThemeData(
                cardTheme: CardTheme(
                    color:HexColor('333739'),
                    shadowColor:Colors.grey.shade700

                ),
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.red,
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: HexColor('333739')),
                    centerTitle: true,
                    titleTextStyle: const TextStyle(fontSize: 20),
                    backgroundColor: HexColor('333739')),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white))),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
