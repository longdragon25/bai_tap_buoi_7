import 'package:bai_tap_buoi_7/models/Movie.dart';
import 'package:bai_tap_buoi_7/screens/details/details_screen.dart';
import 'package:bai_tap_buoi_7/screens/home/components/item_card.dart';
import 'package:bai_tap_buoi_7/screens/home/components/menu.dart';
import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Menu(),
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  itemCount: listMovie.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) => ItemCard(
                        movie: listMovie[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      movie: listMovie[index],
                                    ))),
                      )))
        ],
      ),
    );
  }
}
