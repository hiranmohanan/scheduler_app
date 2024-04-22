import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduler_app/feature/splash/view/splash_view.dart';

import 'feature/Home/home_bloc/home_bloc.dart';
import 'feature/Home/view/home_view.dart';
import 'feature/splash/splash_bloc/splash_bloc.dart';

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
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => const SplashView(),
          '/home': (BuildContext context) => const HomeView(),
        },
        initialRoute: '/splash',
      ),
    );
  }
}
