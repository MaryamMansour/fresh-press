import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/bloc_changes.dart';
import 'package:news/layout/home_layout.dart';

void main() {
  Bloc.observer= MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),

      },

    );
  }
}
