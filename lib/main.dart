import 'package:flutter/material.dart';
import 'package:krishnacoadingchallenge/provider/theme_provider.dart';
import 'package:krishnacoadingchallenge/provider/user_controller.dart';
import 'package:krishnacoadingchallenge/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';

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
          create: (_) => UserProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

      ],

      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}