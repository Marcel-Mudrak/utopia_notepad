import 'package:firebase_core/firebase_core.dart';
import 'package:utopia_recruitment_task/notes.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 238, 108, 77),
);

// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 249, 223, 116),
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Color.fromARGB(255, 160, 108, 213),
        foregroundColor: Color.fromARGB(255, 16, 43, 63),
      ),
      cardTheme: const CardTheme().copyWith(
        color: Color.fromARGB(255, 160, 108, 213),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 2,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 16, 43, 63),
        actionTextColor: Color.fromARGB(255, 226, 207, 234),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 226, 207, 234),
              fontSize: 40,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 6, 39, 38),
              fontSize: 15,
            ),
            bodyMedium: TextStyle(
              color: Color.fromARGB(255, 16, 43, 63),
            ),
            bodySmall: TextStyle(
              color: Color.fromARGB(255, 226, 207, 234),
            ),
          ),
    ),
    home: Notes(),
  ));
}
