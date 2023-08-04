class Category {
  String? photo;
  String? name;


  Category({
    this.photo,
    this.name,

  });

  factory Category.fromJson (Map<String, dynamic> json) =>
      Category(
        photo: json['photo'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() =>
      {
        'photo': photo,
        'name': name,

      };
}