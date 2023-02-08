import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newsLayout.dart';
import 'package:news/shared/bloc_observer.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/network/cache_helper.dart';
import 'package:news/shared/network/dio_helper.dart';
import 'cubit_mode/cubit.dart';
import 'cubit_mode/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeMode(
              fromShared: isDark,
            ),
        )
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.black)
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
              ),
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0)//<-- SEE HERE
                ),
                prefixIconColor: Colors.black,
                labelStyle: TextStyle(color: Colors.black),
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black12,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black12,
                    statusBarBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.black12,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
              ),
              textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                color: Colors.white,
              )),
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
                ),
                prefixIconColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                  backgroundColor: Colors.black38),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
