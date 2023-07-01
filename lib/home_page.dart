







import 'package:flutter/material.dart';
import 'package:flutter_3/widgets/register_/register_themoviedb/main_screen_widget.dart';
import 'package:flutter_3/widgets/register_/register_themoviedb/resgister_page.dart';

class ThemoviedbWidget extends StatelessWidget {
  const ThemoviedbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData
      (appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routes: {
      '/': (context) => Themoviedb(),
      '/secondScreen': (context) => MainScreenWidget(),
    },
      initialRoute: "/",
    );
  }
}