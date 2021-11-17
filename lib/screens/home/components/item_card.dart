import 'package:bai_tap_buoi_7/models/Movie.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Movie? movie;
  final void Function()? press;
  const ItemCard({
    Key? key,
    this.movie,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                // padding: EdgeInsets.all(50),
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(movie!.urlPhoto!))),
              ),
              Positioned(
                child: Text(
                  "${movie!.releaseDate!}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                right: 5,
                bottom: 5,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "${movie!.name!}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
