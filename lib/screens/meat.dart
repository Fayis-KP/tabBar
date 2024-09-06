import 'package:flutter/material.dart';

class Meat extends StatefulWidget {
  final Function(Map<String, String>) addToCart;

  const Meat({super.key, required this.addToCart});

  @override
  State<Meat> createState() => _MeatState();
}

class _MeatState extends State<Meat> {
  List<String> img = [
    "assets/catla.png",
    "assets/cora.png",
    "assets/matti.png",
    "assets/salmon.png",
  ];
  List<String> names = ["catla", "cora", "matti", "salmon"];
  List<String> prices = ["\$35.00/kg", "\$20.50/kg", "\$25.75/kg", "\$30.80/kg"];

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
