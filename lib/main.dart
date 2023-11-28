import 'package:flutter/material.dart';
import 'package:my_news/controller/bottom_controller/bottom_controller.dart';
import 'package:my_news/controller/news_api_controller.dart';
import 'package:my_news/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
