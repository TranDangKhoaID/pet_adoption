import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  final String? id;
  final String? owner_id;
  final String? name;
  final String? image;
  final String? sex;
  final String? age;
  final String? color;
  final int? price;
  final List<String>? album;

  PetModel({
    this.id,
    this.owner_id,
    this.name,
    this.image,
    this.sex,
    this.age,
    this.color,
    this.price,
    this.album,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);
  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
