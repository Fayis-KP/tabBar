import 'package:flutter/material.dart';

class Veg extends StatefulWidget {
  final Function(Map<String, String>) addToCart;

  const Veg({super.key, required this.addToCart});

  @override
  State<Veg> createState() => _VegState();
}

class _VegState extends State<Veg> {
  List<String> img = [
    "assets/carrot.png",
    "assets/onion.png",
    "assets/potato.png",
    "assets/tomato.png"];
  List<String> names = ["Carrot", "Onion", "Potato", "Tomato"];
  List<String> prices = ["\$1.00/kg", "\$0.50/kg", "\$0.75/kg", "\$0.80/kg"];

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