import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_widget/Provider/auth_provider.dart';
import 'package:stateless_widget/Provider/count_proider.dart';
import 'package:stateless_widget/Provider/example_one_provider.dart';
import 'package:stateless_widget/Screen/example_one.dart';
import 'package:stateless_widget/Screen/favourite/favourite_screen.dart';
import 'package:stateless_widget/Screen/login.dart';

import 'Provider/favourite_provider.dart';
import 'Provider/theme_changer_provider.dart';
import 'Screen/count_example.dart';
import 'Screen/dark_theme.dart';
import 'Screen/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Singal provider
    // return ChangeNotifierProvider(
    //   create:(_)=>CountProvider() ,
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home:  ExampleOneScreen(),
    //   ),
    // );

    // Theme Changer:
    // final themeChanger = Provider.of<ThemeChangerProider>(context);

    // Multi  Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CountProvider()),
        ChangeNotifierProvider(create: (_)=>ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeChangerProider()),
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ],

      // child: MaterialApp(
      //   title: 'Flutter Demo',
      //   themeMode: Provider.of<ThemeChangerProider>(context).themeMode,
      //   // theme: ThemeData(
      //   //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   //   useMaterial3: true,
      //   // ),
      //   home:  DarkThemeScreen(),
      // ),

      // if use themeChanger then use this:
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChangerProider>(context);
        return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              // ),
          theme: ThemeData(
              brightness: Brightness.light

          ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                iconTheme: IconThemeData(
                  color: Colors.pink
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.teal
                )

              ),
              home:  LoginScreen(),
            );
      },),
    );
  }
}
