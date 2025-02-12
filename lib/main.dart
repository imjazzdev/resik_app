import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resik/utils/collor_pallete.dart';
import 'package:resik/views/splash.dart';
import 'package:resik/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.gabaritoTextTheme(),
          appBarTheme: AppBarTheme(
              backgroundColor: CollorPallete.primary,
              titleTextStyle:
                  GoogleFonts.gabarito(fontSize: 20, color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white))),
      home: SplashPage(),
    );
  }
}
