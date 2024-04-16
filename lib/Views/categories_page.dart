import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/Models/Data/data.dart';

import 'package:recipe_app/Models/meals_model.dart';
import 'package:recipe_app/Views/products_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  List<Meal> filteredMeals(String categoryId) {
  return meals.where((meal) => meal.categoryIds.contains(categoryId)).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: constraints.maxWidth >= 550 ? 4 : 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(()=> ProductsPage(category: categories[index].name,filterMeals: filteredMeals(categories[index].id),));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Color(categories[index].color),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text(categories[index].name,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
