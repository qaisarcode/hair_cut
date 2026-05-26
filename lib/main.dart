import 'package:flutter/material.dart';
import 'package:hair_cut/provider/darkmode_provider.dart';
import 'package:hair_cut/provider/passobscure_pprovier.dart';
import 'package:hair_cut/splach_services/saplash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkmodeProvider()),
        ChangeNotifierProvider(create: (_) => PassobscurePprovier()),
      ],
      child: Builder(
        builder: (context) {
          final thmechanger = Provider.of<DarkmodeProvider>(context);
          return MaterialApp(
            themeMode: thmechanger.thmemode,
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(brightness: Brightness.dark),
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SaplashScreen(),
          );
        },
      ),
    );
  }
}
