import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridWithStack(),
  ));
}

class GridWithStack extends StatelessWidget {
  var images = [
    "assets/Images/USA.jpg",
    "assets/Images/England.jpeg",
    "assets/Images/France.jpg",
    "assets/Images/Russia.jpg",
    "assets/Images/Canada.jpeg",
  ];
  var name = ["USA", "England", "France", "Russia", "Canada"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Grid View()"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.greenAccent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Text(name[index],
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ],
                  );
                },
                itemCount: 5),
            ),
        );
    }
}