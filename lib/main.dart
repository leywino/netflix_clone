import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.montserrat(color: kWhiteColor),
          bodyMedium: GoogleFonts.montserrat(color: kWhiteColor),
        ),
        primarySwatch: Colors.blue,
      ),
      home: ScreenMainPage(),
    );
  }
}
