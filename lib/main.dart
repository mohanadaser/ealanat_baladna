// ignore_for_file: prefer_const_constructors

import 'package:ealanat_baladna/controller/homecontroller.dart';
import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:ealanat_baladna/controller/masrofy_controller.dart';

import 'package:ealanat_baladna/firebase_options.dart';
import 'package:ealanat_baladna/views/Masrofy/masrofy_screen.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';

import 'package:ealanat_baladna/views/user_panel/login_screen.dart';
import 'package:ealanat_baladna/views/user_panel/register_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'controller/network/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(HomeController());
  Get.put(MainController());
  Get.put(MasrofyController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=========User is currently signed out!');
      } else {
        print('========User is signed in!');
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DependencyInjection.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: HexColor('F5F5F5'),

        // brightness: Brightness.light,
        useMaterial3: true,
      ),

      //  darkTheme: ThemeData.dark().copyWith(
      //    textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
      //   brightness: Brightness.dark,
      //    primaryColor: Colors.amber,
      //  buttonTheme: ButtonThemeData(
      //    buttonColor: Colors.amber,
      //   disabledColor: Colors.grey,
      //  ),
      // ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text("there Error");
          }
          // ignore: unnecessary_null_comparison
          if (snapshot.data == null) {
            return LoginScreen();
          }
          if (snapshot.hasData) {
            print(snapshot.data);
            return const HomeScreen();
          }
          return const Text("");
        },
      ),
      // home: RegisterScreen(),

      //getPages: [GetPage(name: '/home', page: () => HomeScreen())],
    );

    //darkTheme: ThemeData.dark(),
  }
}
