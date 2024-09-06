import 'package:flutter/material.dart';

class Fruit extends StatefulWidget {
  final Function(Map<String, String>) addToCart;

  const Fruit({super.key, required this.addToCart});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  List<String> img = [
    "assets/apple.png",
    "assets/grapes.png",
    "assets/orange.png",
    "assets/strawberry.png"];
  List<String> names = ["Apple", "Grapes", "Orange", "Strawberry"];
  List<String> prices = ["\$10.00/kg", "\$10.50/kg", "\$15.75/kg", "\$20.80/kg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    img[index],
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          names[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          prices[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.addToCart({
                        'image': img[index],
                        'name': names[index],
                        'price': prices[index],
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
