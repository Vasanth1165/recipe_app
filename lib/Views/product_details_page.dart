import 'package:flutter/material.dart';
import 'package:recipe_app/Models/meals_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Meal meal;
  const ProductDetailsPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: NetworkImage(meal.imageUrl)),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  ${meal.title}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  meal.id.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8,),
              title: Text(meal.affordability,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              trailing: Text(meal.complexity),
              subtitle: Text("Duration ${meal.duration} Minutes"),
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Ingredients",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              child: Row(
              children: meal.ingredients.map((e) =>Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Chip(label: Text(e)),
              )).toList(),
            ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Steps to prepare",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemCount: meal.steps.length,
              itemBuilder:(context, index) {
                return ListTile(
                  minLeadingWidth: 0,
                  visualDensity: const VisualDensity(vertical: -4),
                  leading: Text("${index+1}",style: const TextStyle(fontSize: 15),),
                  title: Text(meal.steps[index],textAlign: TextAlign.justify,),
                );
            },)
          ],
        ),
      ),
    );
  }
}
