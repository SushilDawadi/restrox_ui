import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restrox_demo/bloc/bottomNavigation/bloc/bottom_navigation_bloc.dart';
import 'package:restrox_demo/view/restrox/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        routes: {
          MainPage.routeName: (context) => MainPage(),
        },
        home: MainPage(),
      ),
    );
  }
}
