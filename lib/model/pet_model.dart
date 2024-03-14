import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  final String? id;
  final String? owner_id;
  final String? category_id;
  final String? name;
  final String? description;
  final String? location;
  final String? image;
  final String? sex;
  final String? age;
  final String? color;
  final String? create_at;
  final int? price;
  final List<String>? album;

  PetModel({
    this.id,
    this.owner_id,
    this.name,
    this.description,
    this.location,
    this.image,
    this.sex,
    this.age,
    this.color,
    this.price,
    this.album,
    this.category_id,
    this.create_at,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);
  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
