import 'dart:math';
import 'package:flutter/material.dart';
import 'package:getadc/screens/booking%20screen.dart';
import 'package:getadc/screens/counselling.dart';
import 'package:getadc/screens/doctor_screen.dart';
import 'package:getadc/screens/homeScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:getadc/screens/appointment_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import 'help.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DoctorsApp',
          theme: buildThemeData(),
          home:  CustomNavBar(title: '',),
        );
      },
    );
  }
}
MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
ThemeData buildThemeData(){
  return ThemeData(
      primarySwatch: generateMaterialColor(Palette.primary),
    textTheme: TextTheme(
      headline1: GoogleFonts.ubuntu(
        fontSize: 33.0.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
        color: Colors.white,
      ),
      headline2: GoogleFonts.ubuntu(
      fontSize: 33.0.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0,
        color: Colors.white60,
    ), bodyText1: GoogleFonts.yantramanav(
      fontSize: 12.0.sp,
      letterSpacing: 1.0,
      fontWeight: FontWeight.w400,
    ),
      bodyText2: GoogleFonts.yantramanav(
          fontSize: 14.0.sp, letterSpacing: 1.0),
      headline5: GoogleFonts.yantramanav(
          fontSize: 16.0.sp, letterSpacing: 1.0),
    ),
    splashColor: const Color(0xff1651DA),

  );
}
class Palette {
  static const Color primary = Color(0xFF2F4D7D);
}
class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 1;


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  static const List<Widget> pages = [
    homeScreen(),
    counselling(),
    doctor(),
    appintment_screen(),
    bookings()
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: kBoxDecoIndigo,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xffDA165E),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.medical_square),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.heart),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.hospital),
              label: 'Book',
            ),
          ],
        ),
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
