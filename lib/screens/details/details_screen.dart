import 'package:bai_tap_buoi_7/models/Cast.dart';
import 'package:bai_tap_buoi_7/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  final Movie? movie;
  const DetailsScreen({Key? key, this.movie}) : super(key: key);

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
          Image.asset(
            movie!.urlPhoto!,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context, movie)
        ],
      ),
    );
  }
}

_body(BuildContext context, Movie? movie) {
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
      _cast(),
      SizedBox(
        height: 20,
      ),
      _overview()
    ],
  );
}

_header(Movie? movie) {
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
                  image: AssetImage(movie!.urlPhoto!), fit: BoxFit.cover)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${movie!.name!}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Xuất bản: ${movie!.releaseDate!}"),
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

_cast() {
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
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listItemCast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _itemCast(listItemCast[index])),
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
                    image: AssetImage(itemCast.urlPhoto!), fit: BoxFit.cover)),
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

_overview() {
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
          "Nội dung Squid Game xoay quanh những trò chơi tử thần dựa theo trò chơi quen thuộc của trẻ em Hàn Quốc ngày xưa, được tổ chức tại địa điểm bí mật bởi một tổ chức bí ẩn ở Hàn Quốc gồm 456 người tham gia, là những người đang chìm trong nợ nần, gặp khó khăn trong tài chính. Người chiến thắng vượt qua 6 vòng chơi sẽ nhận được phần thưởng 45.6 tỷ won. Đổi lại kẻ thua cuộc sẽ phải trả giá bằng chính mạng sống của mình.",
          style: TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}
