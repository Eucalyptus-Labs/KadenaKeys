// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExampleListResponse _$$_ExampleListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ExampleListResponse(
      example: (json['example'] as List<dynamic>)
          .map((e) => ExampleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExampleListResponseToJson(
        _$_ExampleListResponse instance) =>
    <String, dynamic>{
      'example': instance.example,
    };

_$_ExampleModel _$$_ExampleModelFromJson(Map<String, dynamic> json) =>
    _$_ExampleModel(
      x: json['x'] as String,
      y: json['y'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$_ExampleModelToJson(_$_ExampleModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'link': instance.link,
    };
