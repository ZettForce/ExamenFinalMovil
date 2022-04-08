class RickyModel{
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;

  RickyModel({this.name,this.status,this.species,this.type,this.gender,this.image});

  factory RickyModel.fromJsonMap(Map<String, dynamic> json){
    return RickyModel(
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        image: json['image']
    );
  }
}