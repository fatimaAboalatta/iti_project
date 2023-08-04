class UserModel {
  String? id;
  String? name;
  String? emile;
  String? number;

  UserModel({
    this.id,
    this.number,
    this.name,
    this.emile,
  });

  factory UserModel.fromJson (Map<String, dynamic> json) =>
      UserModel(
        id: json['id'],
        name: json['name'],
        number: json['number' ],
        emile: json["emile"],
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'number': number,
        'emile': emile,
      };
}