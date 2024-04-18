import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/Controllers/wishlist_controller.dart';
import 'package:recipe_app/Models/Data/data.dart';
import 'package:recipe_app/Models/meals_model.dart';
import 'package:recipe_app/Views/product_details_page.dart';

class WishListPage extends StatelessWidget {
  WishListPage({super.key});


  final wishListController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    List<Meal> wishedMeals = meals.where((meal) {
      return wishListController.wishItems.contains(meal.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: wishedMeals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth >= 550 ? 2 : 1,
                mainAxisSpacing: 20,
                mainAxisExtent: 250,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailsPage(meal: wishedMeals[index]));
                  },
                  child: GridTile(
                    header: GridTileBar(
                      title: Text(
                        wishedMeals[index].title,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            wishListController
                                .addToWishList(wishedMeals[index].id);
                          },
                          icon: Obx(() => Icon(
                                wishListController
                                        .isinWishlist(wishedMeals[index].id)
                                    ? Icons.favorite
                                    : Icons.favorite_border, 
                                color: wishListController
                                        .isinWishlist(wishedMeals[index].id) ?  Colors.red: Colors.black,
                              ))),
                      backgroundColor: Colors.white,
                    ),
                    // footer: const GridTileBar(backgroundColor: Colors.white,),
                    child: Image.network(
                      wishedMeals[index].imageUrl,
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