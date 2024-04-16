import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/Models/meals_model.dart';
import 'package:recipe_app/Views/product_details_page.dart';

class ProductsPage extends StatelessWidget {
  final String category;
  final List<Meal> filterMeals;
  const ProductsPage(
      {super.key, required this.category, required this.filterMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: filterMeals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth >= 550 ? 2 : 1,
                mainAxisSpacing: 20,
                mainAxisExtent: 250,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> ProductDetailsPage(meal: filterMeals[index]));
                  },
                  child: GridTile(
                    header: GridTileBar(
                      title: Text(
                        filterMeals[index].title,
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      trailing: IconButton(onPressed: (){
                
                      }, icon: const Icon(Icons.favorite_border,color: Colors.black,)),
                      backgroundColor: Colors.white,
                    ),
                    // footer: const GridTileBar(backgroundColor: Colors.white,),
                    child: Image.network(
                      filterMeals[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
