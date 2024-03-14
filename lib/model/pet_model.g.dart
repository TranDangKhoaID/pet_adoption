// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      id: json['id'] as String?,
      owner_id: json['owner_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      sex: json['sex'] as String?,
      age: json['age'] as String?,
      color: json['color'] as String?,
      price: json['price'] as int?,
      album:
          (json['album'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category_id: json['category_id'] as String?,
      create_at: json['create_at'] as String?,
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'image': instance.image,
      'sex': instance.sex,
      'age': instance.age,
      'color': instance.color,
      'create_at': instance.create_at,
      'price': instance.price,
      'album': instance.album,
    };
