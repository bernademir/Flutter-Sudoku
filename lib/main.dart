import 'package:flutter/material.dart';
import 'package:sudoku/view/home_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter('sudoku');
  await Hive.openBox('settings');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable:
            Hive.box('settings').listenable(keys: ['darktheme', 'lang']),
        builder: (context, box, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: box.get('darktheme', defaultValue: false)
                ? ThemeData.dark()
                : ThemeData.light(),
            home: HomeView(),
          );
        });
  }
}
