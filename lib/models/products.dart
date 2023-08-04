class Prodcuts {
  String? name;
  String? photo;
  String? price;
  String? category;

  Prodcuts({
    this.photo,
    this.price,
    this.name,
    this.category,
  });

  factory Prodcuts.fromJson (Map<String, dynamic> json) =>
      Prodcuts(
        photo: json['photo'],
        name: json['name'],
        price: json['price' ],
        category: json["category"],
      );

  Map<String, dynamic> toJson() =>
      {
        'photo': photo,
        'name': name,
        'price':price,
        'category': category,
      };
}