import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_managmane_dashboard/Navigation/onGenerateRout.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/first_page.dart';
import 'package:student_managmane_dashboard/Pages/SplashScreen/flow/Dating_main_screen/view/dating_main_screen.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/flip_a_card_bloc/card_bloc.dart';
import 'ScreenSizes/screen_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.sizeOf(context);
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    return BlocProvider(
      create: (context) => CardBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management',
        theme: ThemeData(
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRout,
        initialRoute: SplashScreen.name,
      ),
    );
  }
}
