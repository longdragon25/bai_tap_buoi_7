import 'package:bai_tap_buoi_7/data_sources/api_services.dart';
import 'package:bai_tap_buoi_7/models/Movie.dart';
import 'package:bai_tap_buoi_7/models/MovieModel.dart';
import 'package:bai_tap_buoi_7/screens/details/details_screen.dart';
import 'package:bai_tap_buoi_7/screens/home/components/item_card.dart';
import 'package:bai_tap_buoi_7/screens/home/components/menu.dart';
import 'package:flutter/material.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  Future<List<MovieModel>>? futureMovieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Menu(),
          Expanded(
            child: FutureBuilder<List<MovieModel>>(
              future: futureMovieList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Load du lieu loi"),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<MovieModel> movieList = snapshot.data!;
                return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    itemCount: movieList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15),
                    itemBuilder: (context, index) => ItemCard(
                          movie: movieList[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        movie: movieList[index],
                                      ))),
                        ));
              },
            ),
            // child: GridView.builder(
            //     padding: EdgeInsets.symmetric(horizontal: 25),
            //     itemCount: listMovie.length,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         childAspectRatio: 0.70,
            //         crossAxisSpacing: 20,
            //         mainAxisSpacing: 15),
            //     itemBuilder: (context, index) => ItemCard(
            //           movie: listMovie[index],
            //           press: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => DetailsScreen(
            //                         movie: listMovie[index],
            //                       ))),
            //         ))
          )
        ],
      ),
    );
  }

  loadMovie() {
    futureMovieList = ApiServices().fetchMovieList();
  }
}
