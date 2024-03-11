// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      id: json['id'] as String?,
      owner_id: json['owner_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      sex: json['sex'] as String?,
      age: json['age'] as String?,
      color: json['color'] as String?,
      price: json['price'] as int?,
      album:
          (json['album'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'name': instance.name,
      'image': instance.image,
      'sex': instance.sex,
      'age': instance.age,
      'color': instance.color,
      'price': instance.price,
      'album': instance.album,
    };
