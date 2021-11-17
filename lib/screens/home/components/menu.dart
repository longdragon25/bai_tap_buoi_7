import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> menu = ["Popular", "NowPlaying", "Up Coming", "Top Rate"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menu.length,
            itemBuilder: (context, index) => buildMenuItem(index)),
      ),
    );
  }

  Widget buildMenuItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menu[index],
              style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 60,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
