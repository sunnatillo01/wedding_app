import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_app_flutter/screens/category_wedding.dart';
import 'package:wedding_app_flutter/screens/splash_screen.dart';
import 'package:wedding_app_flutter/sss/Search/search_bloc.dart';


import 'package:wedding_app_flutter/sss/getall/countr_bloc.dart';
import 'package:wedding_app_flutter/sss/getwithid/get_with_id_bloc.dart';

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
        BlocProvider(
          create: ((context) => CountrBloc()),
        ),BlocProvider(
          create: ((context) => GetWithIdBloc()),
        ),
        BlocProvider(
          create: ((context) => SearchBloc()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
              labelColor: Colors.pink[800],
              labelStyle: TextStyle(color: Colors.pink[800]), // color for text
              indicator: const UnderlineTabIndicator(
                  // color for indicator (underline)
                  borderSide: BorderSide(color: Colors.orange))),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
