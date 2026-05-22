import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickCode',
      
      theme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: Color(0xFF121212),

        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.grey,
          selectionHandleColor: Colors.white,
        ),

        segmentedButtonTheme: SegmentedButtonThemeData(
          style: SegmentedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(
              color: Colors.grey.shade800,
              width: 1
            )
          )
        ),

        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            side: BorderSide(
              color: Colors.grey.shade800,
              width: 1
            ),
            iconSize: 28,
            padding: EdgeInsets.all(16)
          )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(
              color: Colors.grey.shade800,
              width: 1
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        colorScheme: ColorScheme.dark(
          primary: Colors.grey.shade900,
          secondary: Colors.grey.shade700,
        ),

        cardColor: Color(0xFF1E1E1E),

        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(23, 23, 23, 0),
          foregroundColor: Colors.white,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF222222),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
        ),
      ),



      home: const HomePage(),
    );
  }
}