class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic? voteAverage;
  int? voteCount;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieModel.fromJson(Map<String, dynamic> json) {
    this.adult = json["adult"];
    this.backdropPath = json["backdrop_path"];
    this.genreIds =
        json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    this.id = json["id"];
    this.originalLanguage = json["original_language"];
    this.originalTitle = json["original_title"];
    this.overview = json["overview"];
    this.popularity = json["popularity"];
    this.posterPath = json["poster_path"];
    this.releaseDate = json["release_date"];
    this.title = json["title"];
    this.video = json["video"];
    this.voteAverage = json["vote_average"];
    this.voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["adult"] = this.adult;
    data["backdrop_path"] = this.backdropPath;
    if (this.genreIds != null) data["genre_ids"] = this.genreIds;
    data["id"] = this.id;
    data["original_language"] = this.originalLanguage;
    data["original_title"] = this.originalTitle;
    data["overview"] = this.overview;
    data["popularity"] = this.popularity;
    data["poster_path"] = this.posterPath;
    data["release_date"] = this.releaseDate;
    data["title"] = this.title;
    data["video"] = this.video;
    data["vote_average"] = this.voteAverage;
    data["vote_count"] = this.voteCount;
    return data;
  }
}
