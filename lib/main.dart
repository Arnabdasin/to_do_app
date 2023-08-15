import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/theme_provider.dart';
import 'splash.dart';
import 'home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (_) => ThemeProvider())
    ],
        child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(statusBarColor: Colors.transparent));
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Todo App',
                themeMode: themeProvider.getThemeMode() == ThemeModeType.dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                darkTheme: ThemeData.dark(), // Customize your dark theme here
                theme: ThemeData.light(), // Customize your light theme here
                home: Splash(),
              );
            }
        )
    );
  }
}