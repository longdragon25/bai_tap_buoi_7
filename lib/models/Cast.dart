class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    this.adult = json["adult"];
    this.gender = json["gender"];
    this.id = json["id"];
    this.knownForDepartment = json["known_for_department"];
    this.name = json["name"];
    this.originalName = json["original_name"];
    this.popularity = json["popularity"];
    this.profilePath = json["profile_path"];
    this.castId = json["cast_id"];
    this.character = json["character"];
    this.creditId = json["credit_id"];
    this.order = json["order"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["adult"] = this.adult;
    data["gender"] = this.gender;
    data["id"] = this.id;
    data["known_for_department"] = this.knownForDepartment;
    data["name"] = this.name;
    data["original_name"] = this.originalName;
    data["popularity"] = this.popularity;
    data["profile_path"] = this.profilePath;
    data["cast_id"] = this.castId;
    data["character"] = this.character;
    data["credit_id"] = this.creditId;
    data["order"] = this.order;
    return data;
  }
}
