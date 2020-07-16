import 'package:drawapp/screens/drawpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Letter List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(28, (index) {
            return GestureDetector(
              onTap: () {
                String imagePath = "assets/arabic_alphabet/${index + 1}.png";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DrawPage.withPage(imagePath)),
                );

                print("index : $index");
              },
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.green,
                          image: new DecorationImage(
                              image: new AssetImage(
                                  "assets/arabic_alphabet/${index + 1}.png"),
                              fit: BoxFit.fill)))),
            );
          }),
        ),
      ),
    );
  }
}
