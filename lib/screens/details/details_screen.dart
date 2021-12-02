import 'package:bai_tap_buoi_7/data_sources/api_services.dart';
import 'package:bai_tap_buoi_7/models/Cast.dart';
import 'package:bai_tap_buoi_7/models/Movie.dart';
import 'package:bai_tap_buoi_7/models/MovieModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatefulWidget {
  final MovieModel? movie;
  final Cast? cast;
  const DetailsScreen({Key? key, this.movie, this.cast}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<List<Cast>>? futureCastList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCast(widget.movie!.id!);
  }

  loadCast(int idMovie) {
    futureCastList = ApiServices().fetchCast(idMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/heart3.svg",
                height: 25, width: 25),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/original" + widget.movie!.backdropPath!,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context, widget.movie, futureCastList)
        ],
      ),
    );
  }
}

_body(BuildContext context, MovieModel? movie,
    Future<List<Cast>>? futureCastList) {
  return ListView(
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    children: [
      SizedBox(
        height: 20,
      ),
      _header(movie),
      SizedBox(
        height: 20,
      ),
      _cast(futureCastList),
      SizedBox(
        height: 20,
      ),
      _overview(movie)
    ],
  );
}

_header(MovieModel? movie) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500" + movie!.posterPath!),
                  fit: BoxFit.cover)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${movie.title!}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Xuất bản: ${movie.releaseDate!}"),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thể loại: "),
                    Expanded(
                        child: Text(
                            "Phim hoạt hình, Phim phiêu lưu, Phim giả tưởng, Phim gia đình"))
                  ],
                )
                // Text(
                //     "Thể loại: Phim hoạt hình, Phim phiêu lưu, Phim giả tưởng, Phim gia đình")
              ],
            ),
          ),
        )
      ],
    ),
  );
}

_cast(Future<List<Cast>>? futureCastList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cast",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 180,
            child: FutureBuilder<List<Cast>>(
              future: futureCastList,
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
                List<Cast> listCast = snapshot.data!;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: listCast.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _itemCast(listCast[index]));
              },
            )
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: ClampingScrollPhysics(),
            //     itemCount: listItemCast.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => _itemCast(listItemCast[index])),
            )
      ],
    ),
  );
}

_itemCast(Cast itemCast) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    child: Column(
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                        itemCast.profilePath!),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${itemCast.name}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${itemCast.character}",
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}

_overview(MovieModel? movie) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          movie!.overview!,
          style: TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}
