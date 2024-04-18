import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/Views/categories_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesPage(),
      theme: ThemeData(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.purple.shade400,
          elevation: 0
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0
        ),
        
      ),
    );
  }
}